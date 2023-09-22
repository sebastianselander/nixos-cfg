{pkgs, ...}:
{
    services = {
        polybar = {
            enable = true;
            package = pkgs.polybar.override {};
            config = {
                "bar/example" = {
                    width = "100%";
                    height = "22pt";
                    radius = 0;
                    modules-left = "xmonad";
                    modules-center = "date";
                    modules-right = "pulseaudio xkeyboard wifi memory battery";
                    cursor-click = "pointer";
                    cursor-scroll = "ns-resize";
                    enable-ipc = true;
                    override-redirect = true;

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

                    
                    font-0  = "Symbols Nerd Font:style=Regular";
                    font-1  = "JuliaMono,JuliaMono Latin:style=BoldLatin,Bold";
                    font-2  = "JuliaMono,JuliaMono Black:style=BlackItalic,Italic";
                    font-3  = "JuliaMono:style=Bold";
                    font-4  = "JuliaMono,JuliaMono SemiBold:style=SemiBoldItalic,Italic";
                    font-5  = "JuliaMono,JuliaMono Medium:style=Medium,Regular";
                    font-6  = "JuliaMono:style=Regular";
                    font-7  = "JuliaMono,JuliaMono SemiBold:style=SemiBold,Regular";
                    font-8  = "JuliaMono,JuliaMono Light:style=LightItalic,Italic";
                    font-9  = "JuliaMono:style=BoldItalic";
                    font-10 = "JuliaMono,JuliaMono Medium:style=MediumItalic,Italic";
                    font-11 = "JuliaMono,JuliaMono ExtraBold:style=ExtraBoldItalic,Bold Italic";
                    font-12 = "JuliaMono,JuliaMono ExtraBold:style=ExtraBold,Regular";
                    font-13 = "JuliaMono:style=RegularItalic,Italic";
                    font-14 = "JuliaMono,JuliaMono Light:style=Light,Regular";
                    font-15 = "JuliaMono,JuliaMono Latin:style=RegularLatin,Regular";
                    font-16 = "JuliaMono,JuliaMono Black:style=Black,Regular";
                    font-17 = "IosevkaTerm Nerd Font Mono,IosevkaTerm NFM:style=Regular";
                };

                "colors" = {
                    background = "#aa000000";
                    background-alt = "#aa000000";
                    foreground = "#C5C8C6";
                    primary = "#F0C674";
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
                    date-alt = "%Y-%m-%d %H:%M:%S";

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
                };
                "module/wifi" = {
                    type = "custom/script";
                    exec = "~/Documents/git/nixos-cfg/scripts/internet.sh";
                    click-left = "exec nm-connection-editor";
                    interval = 2;
                    format-foreground = "#FFFFFF";
                };
                "module/pulseaudio" = {
                    type = "internal/pulseaudio";
                    format-volume-prefix = "VOL ";
                    format-volume-prefix-foreground = "\${colors.primary}";
                    format-volume = "<label-volume>";
                    label-volume = "%percentage%%";
                    label-muted = "muted";
                    label-muted-foreground = "\${colors.disabled}";
                };
                "module/memory" = {
                    type = "internal/memory";
                    interval = 3;
                    format-prefix = "RAM ";
                    format-prefix-foreground = "\${colors.primary}";
                    label = "%percentage_used:2%%";
                };
                "module/xkeyboard" = {
                    type = "internal/xkeyboard";
                };
            };
            script = "polybar bar &";
        };
    };
}