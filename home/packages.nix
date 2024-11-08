{inputs}: { pkgs, ... }:
{
  home.packages = with pkgs; [
    (agda.withPackages [ agdaPackages.standard-library ])
    arandr
    audacity
    black
    btop
    cabal2nix
    cargo
    ccls
    chromium
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
    ghc
    ghcid
    glow
    gnumake
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
    lean4
    libreoffice
    lua-language-server
    man-pages
    man-pages-posix
    marksman
    mdcat
    neofetch
    nil
    nix-prefetch-git
    nix-tree
    nixfmt-classic
    nixos-option
    nixpkgs-fmt
    nixpkgs-lint
    obs-studio
    onefetch
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
    tldr
    tree
    typst
    typst-lsp
    typstyle
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
  ] ++ inputs.external-flakes.packages."${pkgs.system}";
}
