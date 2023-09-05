{ config, ... }:

{
    imports =
        [
        ./hardware-configuration.nix
        ];

    networking.hostName = "pc-nixos";

    hardware = {
        opengl = {
            enable = true;
            driSupport = true;
            driSupport32Bit = true;
        };
        nvidia = {
            modesetting.enable = true;
            open = false;
            nvidiaSettings = true;
            package = config.boot.kernelPackages.nvidiaPackages.stable;
        };

        steam-hardware.enable = true;
    };
    services.xserver.videoDrivers = [ "nvidia" ];
    programs.steam.enable = true;
}
