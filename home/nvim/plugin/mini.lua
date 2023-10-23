local ai = require('mini.ai')
local align = require('mini.align')
local comment = require('mini.comment')
local sessions = require('mini.sessions')
local splitjoin = require('mini.splitjoin')
local trailspace = require('mini.trailspace')

ai.setup()
align.setup()
comment.setup()
sessions.setup({
    autoread = false,
    autowrite = true,
    file = 'Session.vim',
})
splitjoin.setup({
    mappings = {
        toggle = 'gs',
    },
})
trailspace.setup()

vim.keymap.set('n', '<leader>tt', function() trailspace.trim() end, {
    noremap = true
})

vim.keymap.set('n', 'gS', function() splitjoin.toggle({
    detect = {
        separator = vim.fn.input("Separator > ")
    }
}) end)
