local ai = require("mini.ai")
local align = require("mini.align")
local splitjoin = require("mini.splitjoin")
local move = require("mini.move")
local surround = require("mini.surround")
local hipatterns = require("mini.hipatterns")
local indentscope = require("mini.indentscope")
local diff = require("mini.diff")
local operators = require("mini.operators")
local icons = require("mini.icons")
local jump = require("mini.jump")
local pairs = require"mini.pairs"

pairs.setup()

ai.setup()

align.setup()

diff.setup()

icons.setup()

jump.setup({
	delay = {
		highlight = 0,
	},
})

vim.keymap.set("n", "<leader>md", diff.toggle_overlay)

indentscope.setup({
	draw = {
		delay = 0,
		animation = indentscope.gen_animation.none(),
	},
	symbol = "│",
})
vim.cmd([[:highlight MiniIndentscopeSymbol guifg=#565f89]])
hipatterns.setup({
	highlighters = {
		hex_color = hipatterns.gen_highlighter.hex_color(),
	},
})
surround.setup({
	mappings = {
		highlight = "",
		update_n_lines = "",
	},
	search_method = "cover_or_next",
})

-- To mimic tpope's
vim.keymap.set("x", "S", [[:<C-u>lua MiniSurround.add('visual')<CR>]], { silent = true })

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

vim.keymap.set("n", "gS", function()
	splitjoin.toggle({
		detect = {
			separator = vim.fn.input("Separator > "),
		},
	})
end)

vim.keymap.del("n", "gx")

operators.setup({
	sort = {
		prefix = "",
	},
})
