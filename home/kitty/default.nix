{ ... }:
{
  programs.kitty = {
    enable = true;
    font = {
      name = "Iosevka";
      size = 15;
    };
    # theme = "Material Dark";
    extraConfig = ''disable_ligatures always'' + builtins.readFile ./kitty-themes/themes/Tokyonight_Storm.conf;
    shellIntegration.enableZshIntegration = true;
    settings = {
      enable_audio_bell = false;
      cursor_shape = "block";
      cursor = "#00FF00";
      background_opacity = 1;
      window_padding_width = 2;
    };

  };
}
