{ config, pkgs, ... }:

let
    kmonad = (import ../../kmonad-deriv/derivation.nix) pkgs;
in

{
    imports =
        [ # Include the results of the hardware scan.
        ./hardware-configuration.nix
        ../../kmonad-deriv/kmonad.nix
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

    services.xserver.kmonad = {
        enable = true;
        configfiles = [ ../../kmonad/pc.kbd ];
        package= kmonad; 
    };
}
