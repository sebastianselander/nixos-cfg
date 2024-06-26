{ ... }:
{
  imports = [
    ./direnv
    ./emacs
    ./git
    ./haskell
    ./kitty
    ./lazygit
    ./nnn
    ./nvim
    ./packages.nix
    ./starship
    ./tmux
    ./wezterm
    ./zathura
    ./zoxide
    ./zsh
  ];

  home = {
    username = "sebastian";
    homeDirectory = "/home/sebastian";
    stateVersion = "23.05";
    language.base = "en_US.UTF-8";
  };
  programs = {
    home-manager = {
      enable = true;
    };
  };
}
