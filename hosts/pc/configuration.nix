{ config, pkgs, ... }:

{
    imports =
        [
        ./hardware-configuration.nix
        ];

    networking.hostName = "pc";

    hardware = {
        graphics = {
          enable32Bit = true;
          enable = true;
          extraPackages = [ pkgs.libvdpau-va-gl ];
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
    programs = {
      steam.enable = true;
      steam.extraCompatPackages = with pkgs; [ proton-ge-bin ];
    };
    programs.virt-manager.enable = true;
    virtualisation.libvirtd.enable = true;

  environment.variables.VDPAU_DRIVER = "va_gl";
  environment.variables.LIBVA_DRIVER_NAME = "nvidia";

  environment.systemPackages = with pkgs; [
    lm_sensors
    lutris
    wineWowPackages.staging
    wine64
    wine
    winetricks
    mangohud
  ];
}
