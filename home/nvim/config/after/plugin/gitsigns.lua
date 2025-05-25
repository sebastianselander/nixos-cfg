local gitsigns = require("gitsigns")

gitsigns.setup()

vim.keymap.set("n", "<leader>gn", function() gitsigns.nav_hunk("next") end)
vim.keymap.set("n", "<leader>gp", function() gitsigns.nav_hunk("prev") end)
