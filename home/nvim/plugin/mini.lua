local ai = require("mini.ai")
local align = require("mini.align")
local comment = require("mini.comment")
local splitjoin = require("mini.splitjoin")
local trailspace = require("mini.trailspace")
local move = require("mini.move")

ai.setup({})
align.setup({})
comment.setup({})
trailspace.setup({})
splitjoin.setup({
	mappings = {
		toggle = "gs",
	},
})

move.setup({
	mappings = {
		left = "<S-h>",
		right = "<S-l>",
		down = "<S-j>",
		up = "<S-k>",
		line_left = "",
		line_right = "",
		line_down = "",
		line_up = "",
	},
})

vim.keymap.set("n", "<leader>tt", function()
	trailspace.trim()
end, {
	noremap = true,
})

vim.keymap.set("n", "gS", function()
	splitjoin.toggle({
		detect = {
			separator = vim.fn.input("Separator > "),
		},
	})
end)
