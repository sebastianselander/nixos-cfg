{ pkgs, ... }:
{
  home.packages = with pkgs; [
    agda
    audacity
    bat
    cabal2nix
    cargo
    cloc
    cron
    discord
    dmenu
    eza
    feh
    ffmpeg
    firefox
    fzf
    gcc
    gh
    ghc
    ghcid
    glow
    gnumake
    hack-font
    haskell-language-server
    haskellPackages.cabal-install
    haskellPackages.cabal-fmt
    haskellPackages.patat
    haskellPackages.stack
    haskellPackages.stylish-haskell
    hlint
    htop
    just
    libreoffice
    lua-language-server
    neofetch
    nerdfonts
    nil
    nix-prefetch-git
    nixos-option
    nixpkgs-fmt
    obs-studio
    pandoc
    pcmanfm
    qbittorrent
    ripgrep
    rlwrap
    roboto
    rust-analyzer
    rustc
    rustfmt
    spotify
    spotify-player
    texlive.combined.scheme-full
    thunderbird
    tree
    typst
    typst-lsp
    typstfmt
    unzip
    vlc
    vscode
    wget
    xclip
    zlib
    zlib.dev
    zoom-us
  ];
}
