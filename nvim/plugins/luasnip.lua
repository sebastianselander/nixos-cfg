local ls = require("luasnip")

-- luasnip binds are created in cmp.lua

vim.keymap.set({"i"}, "<C-E>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-H>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-Q>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})

require("luasnip.loaders.from_snipmate").lazy_load({
    paths = "~/.config/nvim/snippets"
})
