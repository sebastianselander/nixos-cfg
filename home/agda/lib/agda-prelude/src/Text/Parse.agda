module Text.Parse (Tok : Set) where

open import Prelude

private
  data P′ (A : Set) : Set where
    symbolBind : (Tok → P′ A) → P′ A
    fail′ : P′ A
    returnPlus : A → P′ A → P′ A

  _+++′_ : ∀ {A} → P′ A → P′ A → P′ A
  symbolBind f +++′ symbolBind g = symbolBind λ x → f x +++′ g x
  fail′ +++′ q = q
  p +++′ fail′ = p
  returnPlus x p +++′ q = returnPlus x (p +++′ q)
  p +++′ returnPlus x q = returnPlus x (p +++′ q)

  parse′ : ∀ {A} → P′ A → List Tok → List (A × List Tok)
  parse′ (symbolBind _) [] = []
  parse′ (symbolBind f) (c ∷ s) = parse′ (f c) s
  parse′ (returnPlus x p) s = (x , s) ∷ parse′ p s
  parse′ fail′ xs = []

record P (A : Set) : Set₁ where
  constructor mkP
  field
    unP : ∀ {B} → (A → P′ B) → P′ B

open P

symbol : P Tok
symbol = mkP symbolBind

fail : ∀ {A} → P A
fail = mkP λ _ → fail′

infixr 2 _+++_
_+++_ : ∀ {A} → P A → P A → P A
p +++ q = mkP λ k → unP p k +++′ unP q k

private
  ret : ∀ {A} → A → P A
  ret x = mkP λ k → k x

  bind : ∀ {A B} → P A → (A → P B) → P B
  bind p f = mkP λ k → unP p (λ x → unP (f x) k)

parse : ∀ {A} → P A → List Tok → List (A × List Tok)
parse p = parse′ (unP p (λ x → returnPlus x fail′))

parse! : ∀ {A} → P A → List Tok → Maybe A
parse! p s with filter (null ∘ snd) (parse p s)
... | []          = nothing
... | (x , _) ∷ _ = just x

--- Instances ---

instance
  FunctorP : Functor P
  fmap {{FunctorP}} f m = bind m λ x → ret (f x)

  ApplicativeP : Applicative P
  pure {{ApplicativeP}} = ret
  _<*>_ {{ApplicativeP}} = monadAp bind

  MonadP : Monad P
  _>>=_  {{MonadP}} = bind

  SemigroupP : ∀ {A} → Semigroup (P A)
  _<>_   {{SemigroupP}} = _+++_

  MonoidP : ∀ {A} → Monoid (P A)
  Monoid.super MonoidP = SemigroupP
  mempty {{MonoidP}} = fail


--- Derived combinators ---

sat : (p : Tok → Bool) → P (Σ Tok (IsTrue ∘ p))
sat p = symbol >>= match
  where
    -- Inlining 'match' gives internal error!
    match : Tok → P (Σ Tok (IsTrue ∘ p))
    match t = if′ p t then return (t , it) else fail

sat! : (Tok → Bool) → P Tok
sat! p = fst <$> sat p

token : {{EqTok : Eq Tok}} → Tok → P ⊤
token t = _ <$ sat (isYes ∘ _==_ t)

{-# NON_TERMINATING #-}
many many₁ : ∀ {A} → P A → P (List A)
many p = return [] +++ many₁ p
many₁ p = _∷_ <$> p <*> many p
