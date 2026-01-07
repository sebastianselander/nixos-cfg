local snacks = require("snacks")

snacks.setup({
	bigfile = { enabled = true },
	quickfile = { enabled = true },
	zen = { enabled = true },
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
vim.keymap.set("n", "<leader>pp", snacks.picker.resume)
vim.keymap.set("n", "<leader>ps", snacks.picker.grep)
vim.keymap.set("n", "<leader>pc", snacks.picker.colorschemes)
vim.keymap.set("n", "<leader>pw", snacks.picker.grep_word)
vim.keymap.set("n", "<leader>b", function()
	snacks.picker.buffers({
		format = "buffer",
		focus = "list",
		current = false,
		sort_lastused = true,
		win = {
			list = {
				keys = {
					["dd"] = "bufdelete",
				},
			},
		},
	})
end, { desc = "Buffers" })
vim.keymap.set("n", "<leader>pm", snacks.picker.marks)
vim.keymap.set("n", "<leader>pd", snacks.picker.diagnostics)
vim.keymap.set("n", '<leader>"', snacks.picker.registers)
vim.keymap.set("n", "<F1>", snacks.picker.help)

