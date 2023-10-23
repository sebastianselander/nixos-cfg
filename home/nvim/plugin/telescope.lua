local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.setup {
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case',
        },
    },
    defaults = {
        initial_mode = 'normal',
    },
    pickers = {
        find_files = {
            theme = 'ivy',
            initial_mode = 'insert',
            mappings = {
                n = {
                    ['<C-t>'] = 'file_tab',
                    ['<C-s>'] = 'file_vsplit',
                    ['<C-h>'] = 'file_split',
                },
            },
        },
        diagnostics = {
            theme = 'ivy',
        },
        live_grep = {
            initial_mode = 'insert',
            theme = 'ivy',
        },
        marks = {
            theme = 'ivy',
        },
        registers = {
            theme = 'ivy',
        },
        buffers = {
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
    },
}
telescope.load_extension('fzf')

local nnoremap = function(lhs, rhs)
    vim.keymap.set('n', lhs, rhs, { noremap = true })
end

nnoremap('<leader>pf', builtin.find_files)
nnoremap('<C-p>', builtin.git_files)
nnoremap('<leader>ps', builtin.live_grep)
nnoremap('<leader>b', builtin.buffers)
nnoremap('<leader>pr', builtin.registers)
nnoremap('<leader>pm', builtin.marks)
nnoremap('<leader>pd', builtin.diagnostics)
