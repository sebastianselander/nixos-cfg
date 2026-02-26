local snacks = require("snacks")

local layouts = { "ivy", "left", "right", "bottom", "telescope", "vscode", "default" }

local idx = 1

local default_layout = function()
	return layouts[idx]
end

local next_layout = function(picker)
	idx = idx % #layouts + 1
	picker:set_layout(layouts[idx])
end

snacks.setup({
	bigfile = { enabled = true },
	bufdelete = { enabled = true },
	quickfile = { enabled = true },
	zen = {
		toggles = {
			dim = false,
		},
		win = {
			backdrop = {
				transparent = false,
			},
		},
		enabled = true,
	},
	input = { enabled = true },
	dim = {
		enabled = true,
		animate = {
			duration = {
				step = 0,
				total = 0,
			},
		},
	},
	gitbrowse = { enabled = true },
	image = {
		doc = {
			inline = false,
		},
		enabled = false,
	},
	explorer = { enabled = true },
	picker = {
		win = {
			input = {
				keys = {
					["<c-l>"] = { "cycle_layouts", mode = { "i", "n" } },
				},
			},
		},
		actions = {
			cycle_layouts = function(picker)
				next_layout(picker)
			end,
		},
		layout = {
			preset = default_layout(),
		},
		matcher = {
			cwd_bonus = true,
			frecency = true,
		},
		main = {
			current = true,
		},
		enabled = true,
		ui_select = true,
	},
})

vim.api.nvim_create_user_command("Explore", function()
	snacks.explorer()
end, {})

vim.api.nvim_create_user_command("Gitbrowse", function()
	snacks.gitbrowse()
end, {})

vim.keymap.set("n", "<leader>zz", function()
	snacks.zen()
end)

vim.keymap.set("n", "<C-p>", snacks.picker.smart)
vim.keymap.set("n", "<C-l>", snacks.picker.lines)
vim.keymap.set("n", "<leader>p", function()
	snacks.picker()
end)
vim.keymap.set("n", "<leader>.", snacks.picker.resume)
vim.keymap.set("n", "<leader>pp", snacks.picker.resume)
vim.keymap.set("n", "<leader>ps", snacks.picker.lsp_symbols)
vim.keymap.set("n", "<leader>gd", snacks.picker.git_diff)
vim.keymap.set("n", "<leader>/", snacks.picker.grep)
vim.keymap.set("n", "<leader>g/", snacks.picker.git_grep)
vim.keymap.set("n", "<leader>pc", snacks.picker.colorschemes)
vim.keymap.set("n", "<leader>pw", snacks.picker.grep_word)
vim.keymap.set("n", "<leader>pm", snacks.picker.marks)
vim.keymap.set("n", "<leader>pd", snacks.picker.diagnostics)
vim.keymap.set("n", '<leader>"', snacks.picker.registers)
vim.keymap.set("n", "<leader>ph", snacks.picker.help)
vim.keymap.set("n", "<leader>bd", snacks.bufdelete.delete)
