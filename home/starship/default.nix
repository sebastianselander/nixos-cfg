{...}:
{
    programs.starship = {
      enable = true;
      settings = {
        add_newline = false;
        package.disabled = true;
        character = {
          success_symbol = "[-- INSERT --\nλ](bold green)";
          error_symbol = "[-- INSERT --\nΛ](bold red)";
          vimcmd_symbol = "[-- NORMAL --\nλ](bold green)";
          vimcmd_replace_one_symbol = "[-- REPLACE --\nλ](bold green)";
          vimcmd_replace_symbol = "[-- REPLACE --\nλ](bold green)";
          vimcmd_visual_symbol = "[-- VISUAL --\nλ](bold green)";
        };
      };
    };
}
