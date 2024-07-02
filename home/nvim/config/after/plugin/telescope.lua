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
			ignore_current_buffer = true,
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

local nnoremap = function(lhs, rhs)
	vim.keymap.set("n", lhs, rhs, { noremap = true })
end

local telescope_frecency = function()
	require("telescope").extensions.frecency.frecency({
		workspace = "CWD",
		initial_mode = "insert",
        previewer = false,
	})
end

nnoremap("<leader>ph", "<cmd>Telescope hoogle initial_mode=insert theme=ivy<CR>")
nnoremap("<C-p>", telescope_frecency)
nnoremap("<leader>ps", builtin.live_grep)
nnoremap("<leader>pw", builtin.grep_string)
nnoremap("<leader>b", builtin.buffers)
nnoremap("<leader>pm", builtin.marks)
nnoremap("<leader>pd", builtin.diagnostics)
nnoremap('<leader>"', builtin.registers)
