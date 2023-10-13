local tmux = require('tmux')

tmux.setup({
    navigation = {
        enable_default_keybindings = false,
        cycle_navigation = false,
    },
    resize = {
        enable_default_keybindings = false,
    },
})

vim.keymap.set('n', '<A-h>', [[<cmd>lua require("tmux").move_left()<cr>]])
vim.keymap.set('n', '<A-l>', [[<cmd>lua require("tmux").move_right()<cr>]])
vim.keymap.set('n', '<A-k>', [[<cmd>lua require("tmux").move_top()<cr>]])
vim.keymap.set('n', '<A-j>', [[<cmd>lua require("tmux").move_bottom()<cr>]])
vim.keymap.set('n', '<A-w>', [[<cmd>lua require("tmux").resize_top()<cr>]])
vim.keymap.set('n', '<A-s>', [[<cmd>lua require("tmux").resize_bottom()<cr>]])
vim.keymap.set('n', '<A-a>', [[<cmd>lua require("tmux").resize_left()<cr>]])
vim.keymap.set('n', '<A-d>', [[<cmd>lua require("tmux").resize_right()<cr>]])
