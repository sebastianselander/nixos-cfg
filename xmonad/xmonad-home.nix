{pkgs, ...}:
{
    services = {
        betterlockscreen.enable = true;
    };
    gtk.cursorTheme = {
        name = "Breeze";
    };
    home.packages = with pkgs; [
        networkmanagerapplet
        blueman
        pamixer
        xorg.xbacklight
        flameshot
        pavucontrol
    ];
}
