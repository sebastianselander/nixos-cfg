local telescope = require("telescope")
local builtin = require("telescope.builtin")

-- Use in telescope buffers

telescope.setup({
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
		frecency = {
			path_display = { "smart" },
			db_safe_mode = false,
			sort_mru = true,
			sort_lastused = true,
		},
	},
	defaults = {
		prompt_prefix = "> ",
		initial_mode = "normal",
	},
	pickers = {
		find_files = {
			initial_mode = "insert",
			mappings = {
				n = {
					["<C-t>"] = "file_tab",
					["<C-s>"] = "file_vsplit",
					["<C-h>"] = "file_split",
				},
				i = {
					["<C-t>"] = "file_tab",
					["<C-s>"] = "file_vsplit",
					["<C-h>"] = "file_split",
				},
			},
		},
		diagnostics = {},
		live_grep = {
			initial_mode = "insert",
			previewer = true,
		},
		marks = {},
		registers = {},
		buffers = {
			sort_mru = true,
			sort_lastused = true,
			ignore_current_buffer = true,
            theme = "ivy",
			previewer = true,
			path_display = { "smart" },
			mappings = {
				n = {
					["dd"] = "delete_buffer",
				},
			},
		},
	},
})
telescope.load_extension("fzf")
telescope.load_extension("hoogle")
telescope.load_extension("frecency")

vim.keymap.set("n", "<leader>ph", "<cmd>Telescope hoogle initial_mode=insert <CR>")
vim.keymap.set("n", "<C-p>", "<cmd>Telescope frecency workspace=CWD previewer=true initial_mode=insert <CR>")
vim.keymap.set("n", "<leader>ps", builtin.live_grep)
vim.keymap.set("n", "<leader>pw", builtin.grep_string)
vim.keymap.set("n", "<leader>b", builtin.buffers)
vim.keymap.set("n", "<leader>pm", builtin.marks)
vim.keymap.set("n", "<leader>pd", builtin.diagnostics)
vim.keymap.set("n", '<leader>"', builtin.registers)
vim.keymap.set("n", "<F1>", builtin.help_tags)
