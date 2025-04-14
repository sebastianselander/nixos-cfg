local wezterm = require('wezterm')

local config = {
  font             = wezterm.font { family = 'JetBrainsMono Nerd Font' },
  font_size        = 13,
  color_scheme     = 'tokyonight_night',
  scrollback_lines = 10000,
  enable_tab_bar   = false,
  audible_bell     = "Disabled",
  font_rules       = {
    {
      intensity = 'Bold',
      italic = false,
      font = wezterm.font {
        family = 'JetBrainsMono Nerd Font',
        weight = 'Bold',
      }
    },
  },
}

return config
