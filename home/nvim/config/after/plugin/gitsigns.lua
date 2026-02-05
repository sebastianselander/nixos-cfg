local gitsigns = require("gitsigns")

gitsigns.setup()

vim.keymap.set("n", "<leader>gb", function() gitsigns.blame({ ignore_whitespace = true }) end)
vim.keymap.set("n", "<leader>gn", function() gitsigns.nav_hunk("next") end)
vim.keymap.set("n", "<leader>gp", function() gitsigns.nav_hunk("prev") end)
vim.keymap.set("n", "<leader>gs", function() gitsigns.stage_hunk() end)
