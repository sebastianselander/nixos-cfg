{ config, pkgs, ... }:

{
    imports =
        [
        ./hardware-configuration.nix
        ];

    networking.hostName = "pc";

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

  environment.systemPackages = with pkgs; [
    lm_sensors
    lutris
    wine
  ];
}
