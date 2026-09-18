local tmux = require("tmux")

tmux.setup({
	copy_sync = {
		enable = false,
	},
	navigation = {
		enable_default_keybindings = false,
		cycle_navigation = false,
	},
	resize = {
		enable_default_keybindings = false,
	},
})

vim.keymap.set("n", "<A-h>", tmux.move_left)
vim.keymap.set("n", "<A-l>", tmux.move_right)
vim.keymap.set("n", "<A-k>", tmux.move_top)
vim.keymap.set("n", "<A-j>", tmux.move_bottom)
vim.keymap.set("n", "<A-w>", function()
	tmux.resize_top(5)
end)
vim.keymap.set("n", "<A-s>", function()
	tmux.resize_bottom(5)
end)
vim.keymap.set("n", "<A-a>", function()
	tmux.resize_left(5)
end)
vim.keymap.set("n", "<A-d>", function()
	tmux.resize_right(5)
end)
