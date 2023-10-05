local ls = require("luasnip")

-- luasnip binds are created in cmp.lua

require("luasnip.loaders.from_snipmate").lazy_load({
    paths = "~/.config/nvim/snippets"
})
