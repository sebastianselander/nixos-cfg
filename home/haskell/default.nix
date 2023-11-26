{ ... }:
{
  services.hoogle = {
    enable = true;
    packages = hp: with hp; [
      algebraic-graphs
      array
      containers
      directory
      either
      extra
      lens
      megaparsec
      memoize
      mtl
      search-algorithms
      text
      time
      unordered-containers
      vector
    ];
  };
  home.file.".ghci".source = ./.ghci;
  home.file.".haskeline".source = ./.haskeline;
}
