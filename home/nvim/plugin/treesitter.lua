require'nvim-treesitter.configs'.setup {
  modules = {
    highlight = {
      enable = true,
    },
    disable = {
      'haskell',
      'hs',
    },
  },
}
