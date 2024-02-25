require("tokyonight").setup({
	on_colors = function(colors) end,
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

require("cyberdream").setup({
	transparent = true,
	italic_comments = true,
	hide_fillchars = true,
	borderless_telescope = true,
	theme = {
		highlights = {
			CursorLine = { bg = "#292e42" },
		},
	},
})

vim.cmd.colorscheme("cyberdream")
