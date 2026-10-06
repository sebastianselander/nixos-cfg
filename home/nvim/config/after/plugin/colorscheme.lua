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

local background = "dark"
local colorscheme_dark = "catppuccin-frappe"
local colorscheme_light = "catppuccin-latte"

local scheme = colorscheme_dark
if background == "light" then
	scheme = colorscheme_light
end
vim.o.background = background
vim.cmd.colorscheme(colorscheme_dark)

vim.api.nvim_create_user_command("ColorToggle", function()
	local bg = vim.o.background
	if bg == "light" then
		vim.o.background = "dark"
		vim.cmd.colorscheme(colorscheme_dark)
	else
		vim.o.background = "light"
		vim.cmd.colorscheme(colorscheme_light)
	end
end, {})

local hl = vim.api.nvim_get_hl(0, {})
vim.api.nvim_set_hl(0, "WinBar", { bg = hl["StatusLine"].bg, fg = hl["StatusLine"].fg })
vim.api.nvim_set_hl(0, "WinBarNC", { bg = hl["StatusLineNC"].bg, fg = hl["StatusLineNC"].fg })
