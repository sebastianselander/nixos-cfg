{ ... }:
{
  services.hoogle = {
    enable = true;
    packages = hp: with hp; [
      mtl
      lens
      text
      containers
      either
      array
      extra
    ];
  };
  home.file.".ghci".source = ./.ghci;
  home.file.".haskeline".source = ./.haskeline;
}
