
module Numeric.Nat.Prime.Properties where

open import Prelude
open import Control.WellFounded
open import Numeric.Nat.Properties
open import Numeric.Nat.Divide
open import Numeric.Nat.Divide.Properties
open import Numeric.Nat.GCD
open import Numeric.Nat.GCD.Extended
open import Numeric.Nat.GCD.Properties
open import Numeric.Nat.Prime
open import Tactic.Nat

prime-nonzero : ∀ {p} → Prime p → NonZero p
prime-nonzero {0} (prime p>1 _) = refute p>1
prime-nonzero {suc _} _ = _

prime-coprime/divide : ∀ p a → Prime p → Either (Coprime p a) (p Divides a)
prime-coprime/divide p a (prime _ isp) with gcd p a
prime-coprime/divide p a (prime _ isp) | gcd-res d isGCD =
  case isp d (IsGCD.d|a isGCD) of λ where
    (left d=1)   → left  d=1
    (right refl) → right (IsGCD.d|b isGCD)

prime-divide-prime : ∀ {p q} → Prime p → Prime q → p Divides q → p ≡ q
prime-divide-prime {p} (prime p>1 _) (prime _ dq) p|q =
  case dq p p|q of λ where
    (left refl) → refute p>1
    (right p=q) → p=q

prime-split : ∀ {p} a b → Prime p → p Divides (a * b) → Either (p Divides a) (p Divides b)
prime-split a b isP p|ab =
  case prime-coprime/divide _ a isP of λ where
    (left p/a)  → right (coprime-divide-mul-l _ a b p/a p|ab)
    (right p|a) → left p|a

-- It's enough to check prime divisors when checking coprimality.
module _ (a b : Nat) (f : ∀ p → Prime p → p Divides a → p Divides b → p Divides 1) where

  private
    coprimeByPrimes′ : (k : Nat) → Acc _<_ k → k Divides a → k Divides b → k Divides 1
    coprimeByPrimes′ k (acc wf) k|a k|b =
      case isPrime k of λ where
        (yes isP) → f k isP k|a k|b
        (no (composite i j i>1 j>1 refl)) →
          let i|1 : i Divides 1
              i|1 = coprimeByPrimes′ i (wf i (less-mul-l i>1 j>1))
                                       (mul-divides-l i j a k|a) (mul-divides-l i j b k|b)
              j|1 : j Divides 1
              j|1 = coprimeByPrimes′ j (wf j (less-mul-r i>1 j>1))
                                       (mul-divides-r i j a k|a) (mul-divides-r i j b k|b)
          in case₂ divides-one i|1 , divides-one j|1 of λ where
               refl refl → factor! 1
        (tiny (diff! 0)) → factor! 1
        (tiny (diff! 1)) →
          case₂ divides-zero k|a , divides-zero k|b of λ where
            refl refl →
              let 2∤1 = fromDec (2 divides? 1)
                  2|0 = fromDec (2 divides? 0) in
              ⊥-elim (2∤1 (f 2 (fromDec (decPrime 2)) 2|0 2|0))
        (tiny (diff (suc (suc _)) eq)) → refute eq

  coprimeByPrimes : Coprime a b
  coprimeByPrimes = coprimeByDivide a b λ k → coprimeByPrimes′ k (wfNat k)

coprime-mul-r : ∀ a b c → Coprime a b → Coprime a c → Coprime a (b * c)
coprime-mul-r a b c a/b a/c =
  coprimeByPrimes a (b * c) λ p isP p|a p|bc →
  case prime-split b c isP p|bc of λ where
    (left  p|b) → divide-coprime p a b a/b p|a p|b
    (right p|c) → divide-coprime p a c a/c p|a p|c

coprime-mul-l : ∀ a b c → Coprime a c → Coprime b c → Coprime (a * b) c
coprime-mul-l a b c a/c b/c =
  coprime-sym c _ (coprime-mul-r c a b (coprime-sym a _ a/c) (coprime-sym b _ b/c))

prime-divide-coprime : ∀ p a b → Prime p → Coprime a b → p Divides a → p Divides b → ⊥
prime-divide-coprime p a b isP a/b p|a p|b =
  case divides-one {p} (divide-coprime p a b a/b p|a p|b) of λ where
    refl → fromDec (decPrime 1) isP
