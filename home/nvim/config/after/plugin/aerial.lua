require("aerial").setup({
	on_attach = function(bufnr)
        vim.o.foldmethod = "auto"
		vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
		vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
	end,

    manage_folds = true,
	layout = {
		default_direction = "prefer_right",
	},
	autojump = true,
})
-- You probably also want to set a keymap to toggle aerial
vim.keymap.set("n", "<leader>at", "<cmd>AerialToggle!<CR>")
