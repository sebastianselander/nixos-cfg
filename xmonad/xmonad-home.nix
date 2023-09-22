{pkgs, ...}:
{
    services = {
        betterlockscreen.enable = true;
    };
    home.packages = with pkgs; [
        networkmanagerapplet
        blueman
        pamixer
        xorg.xbacklight
        flameshot
    ];
}
