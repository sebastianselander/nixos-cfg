vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.colorcolumn = { 100 }
vim.bo.makeprg = "cabal run"

local bufnr = vim.api.nvim_get_current_buf()
local opts = { noremap = true, silent = true, buffer = bufnr }
local ht = require("haskell-tools")

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
vim.keymap.set("n", "<leader>cl", vim.lsp.codelens.run, opts)
vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
vim.keymap.set("n", "<C-k>", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, opts)
vim.keymap.set("n", "<C-j>", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, opts)
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<leader>ll", vim.diagnostic.setloclist, opts)

vim.keymap.set("n", "<leader>hs", ht.hoogle.hoogle_signature, opts)
vim.keymap.set("n", "<leader>ea", ht.lsp.buf_eval_all, opts)
vim.keymap.set("n", "<leader>rr", ht.repl.toggle, opts)
vim.keymap.set("n", "<leader>rq", ht.repl.quit, opts)
vim.keymap.set("n", "<leader>cp", ht.project.open_package_cabal, opts)
