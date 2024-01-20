local ht = require('haskell-tools')
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.bo.makeprg = "cabal build"
