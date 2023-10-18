local telescope = require('telescope')
local builtin = require('telescope.builtin')
local themes = require('telescope.themes')

telescope.setup {
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case',
        };
    },
    defaults = { },
    pickers = {
        git_status = {
            initial_mode = 'normal',
        },
        git_commits = {
            initial_mode = 'normal',
        },
        find_files = {
            mappings = {
                n = {
                    ['<C-t>'] = 'file_tab',
                    ['<C-s>'] = 'file_vsplit',
                    ['<C-h>'] = 'file_split',
                },
            },
        },
        buffers = {
            initial_mode = 'normal',
            sort_mru = true,
            ignore_current_buffer = true,
            theme = 'dropdown',
            previewer = false,
            mappings = {
                n = {
                    ['dd'] = 'delete_buffer'
                }
            }
        },
        colorscheme = {
            initial_mode = 'normal'
        },
        registers = {
            initial_mode = 'normal'
        },
        marks = {
            initial_mode = 'normal'
        },
    }
}
telescope.load_extension('fzf')

local nnoremap = function(lhs, rhs)
    vim.keymap.set("n", lhs, rhs, { noremap = true})
end

nnoremap('<leader>pf', builtin.find_files)
nnoremap('<C-p>', builtin.git_files)
nnoremap('<leader>ps', builtin.live_grep)
nnoremap('<leader>b', builtin.buffers)
nnoremap('<leader>pr', builtin.registers)
nnoremap('<leader>pm', builtin.marks)
nnoremap('<leader>pd', ":Telescope diagnostics theme=ivy<CR>")
