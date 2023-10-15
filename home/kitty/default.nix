{ ... }:
{
  programs.kitty = {
    enable = true;
  };
  xdg.configFile = {
      "kitty/kitty.conf".source = ./kitty.conf;
      "kitty/kitty-themes" = {
          source = ./kitty-themes;
          recursive = true;
      };
  };
}
