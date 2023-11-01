{ ... }:
{
  imports = [
    ./packages.nix
    ./git
    ./kitty
    ./starship
    ./zathura
    ./zsh
    ./nvim
    ./tmux
    ./emacs
    ./nnn
    ./lazygit
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
