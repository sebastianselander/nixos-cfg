local conform = require'conform'

conform.setup({
  formatters_by_ft = {
    lua     = { "stylua" },
    haskell = { "stylish-haskell" },
    go      = { "gofmt" },
    rust    = { "rustfmt" },
  },
})

vim.keymap.set('n', '<leader>cf', conform.format)
