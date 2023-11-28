require("conform").setup({
  formatters_by_ft = {
    lua     = { "stylua" },
    haskell = { "fourmolu" },
    go      = { "gofmt" },
    rust    = { "rustfmt" },
  },
})
