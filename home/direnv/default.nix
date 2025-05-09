{ pkgs, ... }:
{
  programs.direnv = {
    silent = true;
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    nix-direnv = {
      enable = true;
      package = pkgs.nix-direnv;
    };
  };
}
