local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup({
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
	},
	defaults = {
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
			layout_config = { width = 0.5, height = 0.5 },
			ignore_current_buffer = true,
			previewer = true,
			path_display = { "tail" },
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
telescope.load_extension("aerial")

local nnoremap = function(lhs, rhs)
	vim.keymap.set("n", lhs, rhs, { noremap = true })
end

local telescope_aerial = function()
	require("telescope").extensions.aerial.aerial({
		initial_mode = "insert",
	})
end

nnoremap("<leader>ph", "<cmd>Telescope hoogle initial_mode=insert theme=ivy<CR>")
nnoremap("<leader>pf", telescope_aerial)
nnoremap("<C-p>", "<cmd>Telescope frecency workspace=CWD initial_mode=insert<CR>")
nnoremap("<leader>ps", builtin.live_grep)
nnoremap("<leader>b", builtin.buffers)
nnoremap("<leader>pm", builtin.marks)
nnoremap("<leader>pd", builtin.diagnostics)
nnoremap('<leader>"', builtin.registers)
