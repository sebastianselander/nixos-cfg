{ ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "thinkpad";

  services.tlp.enable = true;
  services.power-profiles-daemon.enable = false;
}
