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
            initial_mode = 'insert',
            mappings = {
                n = {
                    ['<C-t>'] = 'file_tab',
                    ['<C-s>'] = 'file_vsplit',
                    ['<C-h>'] = 'file_split',
                },
            },
        },
        live_grep = {
            initial_mode = 'insert',
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
    vim.keymap.set("n", lhs, rhs, { noremap = true })
end

nnoremap('<leader>pf', ":Telescope find_files<CR>")
nnoremap('<C-p>', ":Telescope git_files<CR>")
nnoremap('<leader>ps', ":Telescope live_grep<CR>")
nnoremap('<leader>b', ":Telescope buffers<CR>")
nnoremap('<leader>pr', ":Telescope registers theme=ivy<CR>")
nnoremap('<leader>pm', ":Telescope marks theme=ivy<CR>")
nnoremap('<leader>pd', ":Telescope diagnostics theme=cursor<CR>")
