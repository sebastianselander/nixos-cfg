local ht = require('haskell-tools')
local bufnr = vim.api.nvim_get_current_buf()
local def_opts = { noremap = true, silent = true, buffer = bufnr }

vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action   , def_opts)
vim.keymap.set('n', 'K'         , vim.lsp.buf.hover         , def_opts)
vim.keymap.set('n', 'gd'        , vim.lsp.buf.definition    , def_opts)
vim.keymap.set('n', 'gD'        , vim.lsp.buf.declaration   , def_opts)
vim.keymap.set('n', 'gi'        , vim.lsp.buf.implementation, def_opts)
vim.keymap.set('n', 'gr'        , vim.lsp.buf.references    , def_opts)
vim.keymap.set('n', '<C-k>'     , vim.diagnostic.goto_prev  , def_opts)
vim.keymap.set('n', '<C-j>'     , vim.diagnostic.goto_next  , def_opts)
vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename        , def_opts)
vim.keymap.set('n', '<leader>cf', function() vim.lsp.buf.format { async = true } end)
vim.keymap.set('n', '<leader>ct', vim.cmd.TroubleToggle)
vim.keymap.set('n', '<leader>cd'  , vim.diagnostic.open_float , def_opts)

-- Hoogle search for the type signature of the definition under the cursor
vim.keymap.set('n', '<leader>hs', ht.hoogle.hoogle_signature, def_opts)
-- Evaluate all code snippets
vim.keymap.set('n', '<leader>ea', ht.lsp.buf_eval_all, def_opts)
-- Toggle a GHCi repl for the current package
vim.keymap.set('n', '<leader>rr', ht.repl.toggle, def_opts)
-- Toggle a GHCi repl for the current buffer
vim.keymap.set('n', '<leader>rf', function()
  ht.repl.toggle(vim.api.nvim_buf_get_name(0))
end, def_opts)
vim.keymap.set('n', '<leader>rq', ht.repl.quit, def_opts)

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
