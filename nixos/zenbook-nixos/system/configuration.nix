{ ... }:

{
    imports = [
        ./hardware-configuration.nix
    ];

    networking.hostName = "zenbook-nixos";

    services.tlp.enable = false;
    services.power-profiles-daemon.enable = true;
}
