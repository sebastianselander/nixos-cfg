{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  networking.hostName = "zenbook-nixos";

  services.tlp.enable = true;
  services.power-profiles-daemon.enable = false;
}
