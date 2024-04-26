local fzf = require "fzf-lua"
fzf.setup({})

vim.keymap.set("n", "<C-p>", function() fzf.files({
    cmd = 'ls',
}) end)
vim.keymap.set("n", "<leader>ps", fzf.live_grep)
vim.keymap.set("n", "<leader>b", fzf.buffers)
vim.keymap.set("n", "<leader>pm", fzf.marks)
vim.keymap.set("n", "<leader>pd", fzf.diagnostics_document)
vim.keymap.set("n", '<leader>"', fzf.registers)
