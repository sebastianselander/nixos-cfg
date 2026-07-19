{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  hardware.enableAllFirmware = true;
  networking.hostName = "thinkpad";

  services.tlp.enable = true;
  services.power-profiles-daemon.enable = false;


  environment.systemPackages = [ pkgs.brightnessctl ];

}
