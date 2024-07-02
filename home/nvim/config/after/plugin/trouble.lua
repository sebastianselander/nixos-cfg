local trouble = require("trouble")
trouble.setup()
vim.keymap.set("n", "<leader>tD", "<cmd>Trouble diagnostics toggle<cr>")
vim.keymap.set("n", "<leader>td", "<cmd>Trouble diagnostics toggle filter.severity=vim.diagnostic.severity.ERROR<cr>")
vim.keymap.set("n", "<leader>tl", "<cmd>Trouble lsp toggle<cr>")
vim.keymap.set("n", "<leader>tq", "<cmd>Trouble qflist toggle<cr>")
vim.keymap.set("n", "<leader>ts", "<cmd>Trouble symbols toggle<cr>")

vim.keymap.set("n", "{", "<cmd>Trouble symbols prev<cr><cmd>Trouble symbols jump<cr>")

vim.keymap.set("n", "}", "<cmd>Trouble symbols next<cr><cmd>Trouble symbols jump<cr>")
