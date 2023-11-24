local wezterm = require('wezterm')

local config = {
  font             = wezterm.font { family = 'Monaspace Neon' },
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
        family = 'Monaspace Krypton',
        weight = 'Bold',
      }
    },
  },
}

return config
