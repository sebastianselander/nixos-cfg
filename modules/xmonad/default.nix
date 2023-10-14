{ pkgs, ... }:

{
  services = {
    logind = {
      extraConfig = "HandleLidSwitch=suspend";
    };
    xserver = {
      libinput = {
        touchpad = {
          naturalScrolling = true;
          disableWhileTyping = true;
          tapping = false;
          middleEmulation = true;
        };

      };
      displayManager = {
        lightdm.enable = true;
        defaultSession = "none+xmonad";
      };
      windowManager = {
        xmonad = {
          enable = true;
          enableContribAndExtras = true;
          config = ./xmonad.hs;
          extraPackages = hpkgs: [
            hpkgs.dbus
          ];
        };
      };
    };

    picom = {
      enable = true;
      vSync = true;
      activeOpacity = 1.0;
      inactiveOpacity = 1.0;
      fade = false;
      shadow = false;
    };
    blueman.enable = true;
  };

  programs.slock.enable = true;
  programs.nm-applet.enable = true;

  environment.systemPackages = with pkgs; [
    xmonad-log
  ];
}
