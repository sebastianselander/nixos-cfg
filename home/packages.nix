{ inputs }:
{ pkgs, ... }: {
  home.packages = with pkgs;
    [
      (agda.withPackages [ agdaPackages.standard-library ])
      (python3.withPackages (ps: with ps; [ python-lsp-black ]))
      alsa-utils
      arandr
      audacity
      bitwarden-desktop
      bitwarden-menu
      btop
      cabal2nix
      cargo
      ccls
      chromium
      clang-tools
      clang
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
      ghc
      ghcid
      glow
      gnumake
      gping
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
      pyright
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
      texliveSmall
      thunderbird
      tinymist
      tldr
      tree
      typst
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
    ];
}
