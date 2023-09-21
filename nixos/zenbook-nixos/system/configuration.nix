{ ... }:

{
    imports = [ ./hardware-configuration.nix ];

    networking.hostName = "zenbook-nixos";

    services.tlp.enable = true;
    services.power-profiles-daemon.enable = false;
}
