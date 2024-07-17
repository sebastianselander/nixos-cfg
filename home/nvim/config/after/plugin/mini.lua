local ai = require("mini.ai")
local align = require("mini.align")
local splitjoin = require("mini.splitjoin")
local move = require("mini.move")
local surround = require("mini.surround")
local hipatterns = require("mini.hipatterns")
local indentscope = require("mini.indentscope")
local diff = require("mini.diff")

ai.setup({})

align.setup({})

diff.setup()

vim.keymap.set("n", "<leader>md", diff.toggle_overlay)

indentscope.setup({
	draw = {
		delay = 0,
        animation = indentscope.gen_animation.none(),
	},
	symbol = "│",
})
vim.cmd[[:highlight MiniIndentscopeSymbol guifg=#565f89]]
hipatterns.setup({
	highlighters = {
		hex_color = hipatterns.gen_highlighter.hex_color(),
	},
})
surround.setup({
	custom_surroundings = nil,
	mappings = {
		add = "ys",
		delete = "ds",
		find = "",
		find_left = "",
		highlight = "",
		replace = "cs",
		update_n_lines = "",
		suffix_last = "",
		suffix_next = "",
	},
	silent = false,
	search_method = "cover_or_next",
})

-- To mimic tpope's
vim.keymap.del("x", "ys")
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
