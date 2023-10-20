local compile_mode = require('compile-mode')
compile_mode.setup({
    no_baleia_support = false,
    split_vertically = false,
    default_command = "make -k",
})

vim.keymap.set('n', '<leader>xx', compile_mode.recompile)
vim.keymap.set('n', '<leader>xc', compile_mode.compile)
