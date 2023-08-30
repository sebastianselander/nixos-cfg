vim.g.cornelis_use_global_binary = 1
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = {"*.agda", "*.lagda"},
    callback = function()
        local opts = { noremap = true, silent = true }
        vim.keymap.set('n', '<C-c><C-l>', '<cmd> CornelisLoad <CR>')
        vim.keymap.set('n', '<C-c>?', '<cmd> CornelisGoals <CR>')
        vim.keymap.set('n', '<C-c><C-x><C-r>', '<cmd> CornleisRestart <CR>')
        vim.keymap.set('n', '<C-c><C-x><C-a> ', '<cmd> CornelisAbort <CR>')
        vim.keymap.set('n', '<C-c><C-s>', '<cmd> CornelisSolve <CR>')
        vim.keymap.set('n', '<C-c><C-b>', '<cmd> CornelisPrevGoal <CR>')
        vim.keymap.set('n', '<C-c><C-f>', '<cmd> CornelisNextGoal <CR>')
        vim.keymap.set('n', '<C-c><C-space>', '<cmd> CornelisGive <CR>')
        vim.keymap.set('n', '<C-c><C-r>', '<cmd> CornelisRefine <CR>')
        vim.keymap.set('n', '<C-c><C-m>', '<cmd> CornelisElaborate <CR>')
        vim.keymap.set('n', '<C-c><C-a>', '<cmd> CornelisAuto <CR>')
        vim.keymap.set('n', '<C-c><C-c>', '<cmd> CornelisMakeCase <CR>')
        vim.keymap.set('n', '<C-c><C-,>', '<cmd> CornelisTypeContext <CR>')
        vim.keymap.set('n', '<C-c><C-d>', '<cmd> CornelisTypeInfer <CR>')
        vim.keymap.set('n', '<C-c><C-.>', '<cmd> CornelisTypeContextInfer <CR>')
        vim.keymap.set('n', '<C-c><C-n>', '<cmd> CornelisNormalize <CR>')
        vim.keymap.set('n', '<C-c><C-w>', '<cmd> CornelisWhyInScope <CR>')
        vim.keymap.set('n', '<C-c><C-h>', '<cmd> CornelisHelperFunc <CR>')
        vim.keymap.set('n', 'gd', '<cmd> CornelisGoToDefinition <CR>')
    end
    })
