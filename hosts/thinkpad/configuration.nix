{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "thinkpad";

  programs.light.enable = true;

  services.tlp.enable = true;
  services.power-profiles-daemon.enable = false;
}
