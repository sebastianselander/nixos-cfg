{pkgs, ...}:
{
    services = {
        betterlockscreen.enable = true;
    };
    home.pointerCursor = {
        size = 20;
        package = pkgs.nordzy-cursor-theme;
        name = "Nordzy-cursors-white";
    };
    home.packages = with pkgs; [
        networkmanagerapplet
        blueman
        pamixer
        xorg.xbacklight
        flameshot
        pavucontrol
        nitrogen
    ];
}
