---- REMAPS -------------------------------------------------------------------
local map = vim.keymap.set

vim.g.mapleader = ' '

map('n', '<space>', '<Nop>')
map('n', '<esc>', vim.cmd.noh)
map('n', 'J', 'mzJ`zdmz')
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
map('n', 'N', 'Nzzzv')
map('n', 'n', 'nzzzv')
map('n', 'Y', 'yg$')

-- Tabs.
map('n', '<leader>1', '1gt')
map('n', '<leader>2', '2gt')
map('n', '<leader>3', '3gt')
map('n', '<leader>4', '4gt')
map('n', '<leader>5', '5gt')
map('n', '<leader>6', '6gt')
map('n', '<leader>7', '7gt')
map('n', '<leader>8', '8gt')
map('n', '<leader>9', '9gt')

map('n', '<leader>tn', '<cmd> tabnew % <CR> <cmd> tabm <CR>')
map('n', '<leader>tm', '<cmd> tabm 0 <CR>')

map('t', '<Esc>', "<C-\\><C-n>")

-- Windows.
map('n', '<A-l>', '<C-w>l')
map('n', '<A-h>', '<C-w>h')
map('n', '<A-k>', '<C-w>k')
map('n', '<A-j>', '<C-w>j')
map('n', '<A-w>', '<C-w>+')
map('n', '<A-s>', '<C-w>-')
map('n', '<A-a>', '<C-w>>')
map('n', '<A-d>', '<C-w><')

-- Nice
map('x', '<leader>p', '\"_dP')

map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

map('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

---- CMD ----------------------------------------------------------------------

vim.cmd("cnoreabbrev Q  q")
vim.cmd("cnoreabbrev q1  q!")
vim.cmd("cnoreabbrev Q1  q!")
vim.cmd("cnoreabbrev Qa1 qa!")
vim.cmd("cnoreabbrev Qa qa")
vim.cmd("cnoreabbrev W  w")
vim.cmd("cnoreabbrev Wq wq")
vim.cmd("cnoreabbrev WQ wq")
vim.cmd("cnoreabbrev Set set")
vim.cmd("cnoreabbrev SEt set")
vim.cmd("cnoreabbrev SET set")

-- Highlight yank
vim.cmd([[
  augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='ErrorMsg', timeout=500 }
  augroup END
]])
---- SET ----------------------------------------------------------------------

vim.g.netrw_bufsettings = "noma nomod nu nowrap ro nobl"
vim.opt.backup = false
vim.opt.colorcolumn = { 80, 100, 120 }
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.guicursor = ""
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.isfname:append "@-@"
vim.opt.list = true
vim.opt.listchars = "tab:> ,lead:·,trail: ,extends:⇢,precedes:⇠,nbsp:+"
vim.opt.mouse = ""
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.shiftwidth = 4
vim.opt.signcolumn = "yes"
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.updatetime = 100
vim.opt.wrap = false
vim.opt.conceallevel = 2

-- "Don't want to automatically insert comment leaders after using `o` in normal
-- mode.  Doesn't work without the autocmd for some freak reason." - Typesafety
vim.cmd [[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o formatoptions+=j formatoptions+=q]]
