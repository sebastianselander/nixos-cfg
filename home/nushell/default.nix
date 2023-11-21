{ ... }:
{
  programs.nushell = {
    enable = true;
  };

  xdg.configFile = {
    "nushell/" = {
      source = ./nushell;
      recursive = true;
    };
  };
}
