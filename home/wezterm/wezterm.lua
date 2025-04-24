local wezterm = require("wezterm")

local config = {
  color_scheme     = 'tokyonight_night',
	font = wezterm.font({ family = "FiraCode Nerd Font" }),
	font_size = 13,
	scrollback_lines = 10000,
	enable_tab_bar = false,
	audible_bell = "Disabled",
	window_background_opacity = 1.0,
    adjust_window_size_when_changing_font_size = false,
    cursor_blink_rate = 0,
    window_padding = {
        left = 0,
        top = 0,
        right = 0,
        bottom = 0,
    },
	keys = {
		{
			key = "=",
			mods = "CTRL",
            action = wezterm.action.DisableDefaultAssignment,
		},
        {
            key = "-",
			mods = "CTRL",
            action = wezterm.action.DisableDefaultAssignment,
        },
		{
			key = "=",
			mods = "CTRL|SHIFT",
            action = wezterm.action.IncreaseFontSize,
		},
        {
            key = "-",
			mods = "CTRL|SHIFT",
            action = wezterm.action.DecreaseFontSize,
        },
	},
}

return config
