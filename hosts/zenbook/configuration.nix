{ ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "zenbook";

  services.tlp.enable = true;
  services.power-profiles-daemon.enable = false;
}
