{ pkgs, ... }:

{
  services = {
      displayManager = {
        defaultSession = "none+xmonad";
      };
    logind = {
      extraConfig = "HandleLidSwitch=suspend";
    };
    libinput = {
        touchpad = {
          naturalScrolling = true;
          disableWhileTyping = true;
          tapping = false;
          middleEmulation = true;
        };
    };
    xserver = {
      displayManager = {
        lightdm.enable = true;
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

  programs = {
    slock.enable = true;
    nm-applet.enable = true;
    i3lock.enable = true;
  };

  environment.systemPackages = with pkgs; [
    xmonad-log
  ];
}
