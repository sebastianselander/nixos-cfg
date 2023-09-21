{ ... }:

{
    imports = [
        ./hardware-configuration.nix
        ../../../xmonad/xmonad.nix
        ../../../plasma/plasma.nix
    ];

    networking.hostName = "zenbook-nixos";

    services.tlp.enable = true;
    services.power-profiles-daemon.enable = false;
}
