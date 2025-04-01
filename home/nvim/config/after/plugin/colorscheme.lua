require("tokyonight").setup({
	terminal_colors = true,
	day_brightness = 0.3,
	dim_inactive = false,
	lualine_bold = true,
	cache = true,
	plugins = {
		all = true,
		auto = true,
	},
	on_colors = function(colors)
		-- colors.fg_gutter = "#5b638d"

		-- default is:
		colors.fg_gutter = "#3b4261"
	end,
	on_highlights = function(_, _) end,
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

vim.cmd.set("background=dark")
vim.cmd.colorscheme("tokyonight")
