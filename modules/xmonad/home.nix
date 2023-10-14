{ pkgs, ... }:
{
  imports = [
    ./polybar
  ];
  services.betterlockscreen.enable = true;
  home = {
    pointerCursor = {
      size = 30;
      package = pkgs.nordzy-cursor-theme;
      name = "Nordzy-cursors-white";
    };
    packages = with pkgs; [
      networkmanagerapplet
      blueman
      pamixer
      xorg.xbacklight
      flameshot
      pavucontrol
      nitrogen
    ];
  };
}
