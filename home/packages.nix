{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (agda.withPackages [ agdaPackages.standard-library ])
    audacity
    bat
    black
    btop
    cabal2nix
    cargo
    clippy
    cloc
    cron
    difftastic
    discord
    distrobox
    dmenu
    edir
    eza
    fd
    feh
    ffmpeg
    file
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
    haskellPackages.fourmolu
    haskellPackages.hoogle
    haskellPackages.patat
    haskellPackages.stack
    haskellPackages.stylish-haskell
    hlint
    just
    libreoffice
    lua-language-server
    man-pages
    man-pages-posix
    marksman
    mdcat
    neofetch
    nerdfonts
    nil
    nix-prefetch-git
    nix-tree
    nixfmt
    nixos-option
    nixpkgs-fmt
    nixpkgs-lint
    obs-studio
    onefetch
    pandoc
    comma
    pcmanfm
    python3
    qbittorrent
    remmina
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
    tldr
    tree
    typst
    typst-lsp
    typstfmt
    unzip
    vlc
    vscode
    watchexec
    wget
    xclip
    xorg.xhost
    zip
    zlib
    zlib.dev
    zoom-us
  ];
}
