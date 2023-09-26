-- place this in one of your configuration file(s)
local hop = require('hop').setup{
    vim.keymap.set('n', '<CR>', ":HopWord<CR>")
}
