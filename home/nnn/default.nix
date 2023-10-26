{ ... }:
{
  programs.nnn = {
    enable = true;
    bookmarks = {
      g = "~/Documents/git";
    };
    package = {
      withNerdIcons = true;
    };
  };
}
