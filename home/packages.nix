{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (agda.withPackages [ agdaPackages.standard-library ])
    audacity
    bat
    cabal2nix
    cargo
    clippy
    cloc
    cron
    discord
    distrobox
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
    haskellPackages.cabal-fmt
    haskellPackages.cabal-install
    haskellPackages.fast-tags
    haskellPackages.hoogle
    haskellPackages.patat
    haskellPackages.stack
    haskellPackages.stylish-haskell
    hlint
    htop
    just
    libreoffice
    lua-language-server
    marksman
    neofetch
    nerdfonts
    nil
    nix-prefetch-git
    nixos-option
    nixfmt
    obs-studio
    pandoc
    pcmanfm
    python3
    qbittorrent
    ripgrep
    rlwrap
    roboto
    rust-analyzer
    rustc
    rustfmt
    spotify
    spotify-player
    stylua
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
    xorg.xhost
    zlib
    zlib.dev
    zoom-us
  ];
}
