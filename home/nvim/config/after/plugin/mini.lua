local ai = require("mini.ai")
local bracketed = require("mini.bracketed")
local align = require("mini.align")
local splitjoin = require("mini.splitjoin")
local move = require("mini.move")
local surround = require("mini.surround")
local hipatterns = require("mini.hipatterns")
local indentscope = require("mini.indentscope")
local operators = require("mini.operators")
local icons = require("mini.icons")
local notify = require("mini.notify")
local hues = require("mini.hues")

notify.setup()

bracketed.setup()


hues.setup({ background = "#24283b", foreground = "#c0caf5" })

ai.setup({
	custom_textobjects = {
		m = {
			{
				-- Matches a single uppercase letter followed by 1+ lowercase letters.
				-- This covers:
				-- - PascalCaseWords (or the latter part of camelCaseWords)
				"%u[%l%d]+%f[^%l%d]", -- An uppercase letter, 1+ lowercase letters, to end of lowercase letters

				-- Matches lowercase letters up until not lowercase letter.
				-- This covers:
				-- - start of camelCaseWords (just the `camel`)
				-- - snake_case_words in lowercase
				-- - regular lowercase words
				"%f[^%s%p][%l%d]+%f[^%l%d]", -- after whitespace/punctuation, 1+ lowercase letters, to end of lowercase letters
				"^[%l%d]+%f[^%l%d]", -- after beginning of line, 1+ lowercase letters, to end of lowercase letters

				-- Matches uppercase or lowercase letters up until not letters.
				-- This covers:
				-- - SNAKE_CASE_WORDS in uppercase
				-- - Snake_Case_Words in titlecase
				-- - regular UPPERCASE words
				-- (it must be both uppercase and lowercase otherwise it will
				-- match just the first letter of PascalCaseWords)
				"%f[^%s%p][%a%d]+%f[^%a%d]", -- after whitespace/punctuation, 1+ letters, to end of letters
				"^[%a%d]+%f[^%a%d]", -- after beginning of line, 1+ letters, to end of letters
			},
			"^().*()$",
		},
	},
})
align.setup()

icons.setup()

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

vim.keymap.set("x", "s", [[:<C-u>lua MiniSurround.add('visual')<CR>]], { silent = true })

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
	replace = {
		prefix = "",
	},
})

vim.api.nvim_create_user_command("NotifyHistory", function()
	notify.show_history()
end, {})
