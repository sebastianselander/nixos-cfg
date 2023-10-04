local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.setup {
    defaults = {

    },
    pickers = {
        live_grep = {
            theme = 'ivy',
        },
        git_commits = {
            initial_mofilesde = "normal",
        },
        find_files = {
            mappings = {
                n = {
                    ["<C-t>"] = "file_tab",
                    ["<C-s>"] = "file_vsplit",
                    ["<C-h>"] = "file_split",
                },
            },
        },
        buffers = {
            initial_mode = "normal",
            sort_mru = true,
            ignore_current_buffer = true,
            theme = "dropdown",
            previewer = false,
            mappings = {
                n = {
                    ["dd"] = "delete_buffer"
                }
            }
        },
        colorscheme = {
            initial_mode = "normal"
        },
        registers = {
            initial_mode = "normal"
        },
    }
}
telescope.load_extension("fzf")

local nnoremap = function(lhs, rhs)
    vim.keymap.set('n', lhs, rhs, { noremap = true })
end

nnoremap('<leader>pf', builtin.find_files)
nnoremap('<C-p>', builtin.git_files)
nnoremap('<leader>ps', builtin.grep_string)
nnoremap('<leader>b', builtin.buffers)
nnoremap('<leader>pr', builtin.registers)
nnoremap('<leader>pt', builtin.help_tags)
nnoremap('<leader>pcs', builtin.colorscheme)
nnoremap('<leader>pgc', builtin.git_commits)
