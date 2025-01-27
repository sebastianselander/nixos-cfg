{ pkgs, ... }: {
  services = {
    polybar = {
      enable = true;
      package = pkgs.polybar.override { };
      config = {
        "bar/xmonadbar" = {
          width = "100%";
          height = "22pt";
          radius = 0;
          modules-left = "xmonad";
          modules-center = "date";
          modules-right = "pipewire xkeyboard memory battery";
          cursor-click = "pointer";
          cursor-scroll = "ns-resize";
          enable-ipc = true;
          override-redirect = true;
          tray-position = "right";
          tray-maxsize = 30;
          pseudo-transparent = true;
          background = "\${colors.background}";
          foreground = "\${colors.foreground}";
          line-size = "3pt";
          line-color = "#FFAA00";
          border-size = "0pt";
          border-color = "#aa000000";
          padding-left = 0;
          padding-right = 1;
          module-margin = 1;
          separator = "|";
          separator-foreground = "\${colors.disabled}";
          font-0 = "Symbols Nerd Font:style=Regular";
          font-1 = "Iosevka SemiBold:style=SemiBold";
          font-2 = "IBM Plex Mono:style=SemiBold";
          font-3 = "JuliaMono,JuliaMono Latin:style=BoldLatin,Bold";
        };

        "colors" = {
          background = "#24283b";
          # background = "#121212";
          background-alt = "#24283b";
          foreground = "#a9b1d6";
          primary = "#41a6b5";
          secondary = "#8ABEB7";
          alert = "#A54242";
          disabled = "#707880";
        };
        "module/xmonad" = {
          type = "custom/script";
          exec = "xmonad-log";
          tail = true;
        };
        "module/date" = {
          type = "internal/date";
          interval = 1;
          date = "%H:%M";
          date-alt = "%a %Y-%m-%d %H:%M:%S";

          label = "%date%";
          label-foreground = "\${colors.primary}";
        };
        "module/battery" = {
          type = "internal/battery";
          full-at = 99;
          low-at = 10;
          battery = "BAT0";
          adapter = "AC0";
          poll-interval = 5;
          format-charging = "<label-charging>";
          format-discharging = "<label-discharging>";
          label-charging = "%{F#41a6b5}CHARGING%{F-} %percentage%%";
          label-discharging = "%{F#41a6b5}BAT%{F-} %percentage%%";
          label-full = "BAT FULL";
          label-low = "BAT %percentage%%";
        };
        "module/wifi" = {
          type = "custom/script";
          exec =
            "~/Documents/git/nixos-cfg/modules/xmonad/polybar/scripts/internet.sh";
          click-left = "exec nm-connection-editor";
          interval = 2;
          format-foreground = "#FFFFFF";
        };
        "module/pipewire" = {
          type = "custom/script";
          exec =
            "~/Documents/git/nixos-cfg/modules/xmonad/polybar/scripts/polybar-pipewire/pipewire.sh";
          interval = 1;
          click-right = "exec pavucontrol &";
          click-left =
            "~/Documents/git/nixos-cfg/modules/xmonad/polybar/scripts/polybar-pipewire/pipewire.sh --mute &";
        };
        "module/memory" = {
          type = "internal/memory";
          interval = 3;
          format-prefix = "RAM ";
          format-prefix-foreground = "\${colors.primary}";
          label = "%percentage_used:2%%";
        };
        "module/xkeyboard" = { type = "internal/xkeyboard"; };
        "module/vpn" = {
          type = "custom/script";
          exec =
            "~/Documents/git/nixos-cfg/modules/xmonad/polybar/scripts/polybar-vpn-controller/vpn_module.sh status mullvad";
          click-right = "mullvad-vpn";
          interval = 5;
          format = "<label>";
        };
        "module/bluetooth" = {
          type = "custom/script";
          exec =
            "~/Documents/git/nixos-cfg/modules/xmonad/polybar/scripts/polybar-bluetooth/bluetooth.sh";
          interval = 2;
          click-left =
            "~/Documents/git/nixos-cfg/modules/xmonad/polybar/scripts/polybar-bluetooth/toggle_bluetooth.sh";
          click-right = "exec blueman-manager";
          format-foreground = "#ffffff";
        };
      };
      script = "polybar xmonadbar & disown";
    };
  };
}
