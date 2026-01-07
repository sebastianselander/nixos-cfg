require("nvim-treesitter").setup({
	highlight = {
		enable = true,
		disable = {},
	},
	modules = {},
	ensure_installed = {}, -- Not friendly with nixos
	sync_install = false,
	ignore_install = {},
	auto_install = false,
})
