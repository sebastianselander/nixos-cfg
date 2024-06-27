{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages_6_8;
  hardware.enableAllFirmware = true;
  networking.hostName = "thinkpad";

  programs.light.enable = true;

  services.tlp.enable = true;
  services.power-profiles-daemon.enable = false;
}
