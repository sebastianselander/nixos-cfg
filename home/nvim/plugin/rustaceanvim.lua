local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<C-k>', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', '<C-j>', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<leader>cf', function() vim.lsp.buf.format { async = true } end)
  vim.keymap.set('n', '<leader>ct', vim.cmd.TroubleToggle)

  vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)
end

vim.g.rustaceanvim = {
  server = {
    on_attach = on_attach
  }
}
