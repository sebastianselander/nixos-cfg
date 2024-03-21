require("tokyonight").setup({
	on_colors = function(colors) 
        colors.fg_gutter = "#5b638d"

        -- default is:
        -- colors.fg_gutter = "#3b4261"
    end,
	on_highlights = function(highlights, colors) end,
	style = "storm",
	light_style = "day",
	transparent = false,
	styles = {
		comments = {
			italic = true,
		},
		keywords = {
			italic = false,
		},
		functions = {},
		variables = {},
		sidebars = "dark",
		floats = "dark",
	},

	sidebars = {
		"qf",
		"help",
		"Lazy",
		"terminal",
	},
})

vim.cmd.colorscheme("catppuccin-macchiato")
