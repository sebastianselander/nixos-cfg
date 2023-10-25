{ pkgs, ... }:
{
  programs.nnn = {
    enable = true;
    bookmarks = {
        g = "~/Documents/git";
        x = ":! chmod +x $nnn";
    };
    package = {
        withNerdIcons = true;
    };
  };
}
