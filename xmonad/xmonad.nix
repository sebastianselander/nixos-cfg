{pkgs, ...}:

{
    services = {
        xserver = {
            displayManager = {
                lightdm.enable = true;
                defaultSession = "none+xmonad";
            };
            windowManager = {
                xmonad = {
                    enable = true;
                    enableContribAndExtras = true;
                    config = ../xmonad/xmonad.hs;
                    extraPackages = hpkgs: [
                        hpkgs.dbus
                    ];
                };
            };
        };

        picom = {
            enable = true;
            activeOpacity = 1.0;
            inactiveOpacity = 1.0;
            fade = false;
            shadow = false;
        };

    };

    environment.systemPackages = with pkgs; [
        xmonad-log
    ];
}
