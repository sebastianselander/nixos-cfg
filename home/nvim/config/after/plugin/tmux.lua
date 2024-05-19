local tmux = require('tmux')

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

vim.keymap.set('n', '<A-h>', tmux.move_left)
vim.keymap.set('n', '<A-l>', tmux.move_right)
vim.keymap.set('n', '<A-k>', tmux.move_top)
vim.keymap.set('n', '<A-j>', tmux.move_bottom)
vim.keymap.set('n', '<A-w>', tmux.resize_top)
vim.keymap.set('n', '<A-s>', tmux.resize_bottom)
vim.keymap.set('n', '<A-a>', tmux.resize_left)
vim.keymap.set('n', '<A-d>', tmux.resize_right)
