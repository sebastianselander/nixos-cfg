{ inputs, extraImports, ... }: {
  imports = [
    (import ./packages.nix { inherit inputs; })
    ./atuin
    ./bat
    ./direnv
    ./emacs
    ./git
    ./github
    ./haskell
    ./kitty
    ./lazygit
    ./nnn
    ./nvim
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
