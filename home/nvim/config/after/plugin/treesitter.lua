require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
	},
	modules = {},
    ensure_installed = {}, -- Not friendly with nixos
	sync_install = false,
	ignore_install = {},
	auto_install = false,
})
