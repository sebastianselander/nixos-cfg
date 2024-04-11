local gx = require("gx")

gx.setup({
	init = function()
		vim.g.netrw_nogx = 1
	end,
})
vim.keymap.set({ "n", "x" }, "gx", "<cmd>Browse<cr>")
