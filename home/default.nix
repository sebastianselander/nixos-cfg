{ inputs, extraImports, ... }: {
  imports = [
    ./direnv
    ./emacs
    ./git
    ./haskell
    ./kitty
    ./lazygit
    ./nnn
    ./nvim
    ./github
    (import ./packages.nix { inherit inputs; })
    ./starship
    ./tmux
    ./wezterm
    ./zathura
    ./zoxide
    ./zsh
  ] ++ extraImports;

  home = {
    username = "sebastian";
    homeDirectory = "/home/sebastian";
    stateVersion = "23.05";
    language.base = "en_US.UTF-8";
  };
  programs = { home-manager = { enable = true; }; };
}
