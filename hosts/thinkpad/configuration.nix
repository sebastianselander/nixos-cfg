{ ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  hardware.enableAllFirmware = true;
  networking.hostName = "thinkpad";

  programs.light.enable = true;

  services.tlp.enable = true;
  services.power-profiles-daemon.enable = false;
}
