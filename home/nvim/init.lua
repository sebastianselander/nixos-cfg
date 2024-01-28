---- REMAPS -------------------------------------------------------------------
local map = vim.keymap.set
local g = vim.g
local o = vim.o
local opt = vim.opt
local cmd = vim.cmd

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

map('x', '.', ':norm .<CR>')

for c in ("abcdefghijklmnopqrstuvwxyz"):gmatch(".") do
    map('x', "@"..c, ":norm @"..c..'<CR>')
end

---- CMD ----------------------------------------------------------------------

cmd("cnoreabbrev Q  q")
cmd("cnoreabbrev q1  q!")
cmd("cnoreabbrev Q1  q!")
cmd("cnoreabbrev Qa1 qa!")
cmd("cnoreabbrev Qa qa")
cmd("cnoreabbrev W  w")
cmd("cnoreabbrev Wq wq")
cmd("cnoreabbrev WQ wq")
cmd("cnoreabbrev Set set")
cmd("cnoreabbrev SEt set")
cmd("cnoreabbrev SET set")

-- Highlight yank
cmd([[
  augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='ErrorMsg', timeout=500 }
  augroup END
]])
---- SET ----------------------------------------------------------------------

o.cmdheight = 0

g.netrw_bufsettings = "noma nomod nu nowrap ro nobl"

opt.lazyredraw = true

opt.backup = false
opt.colorcolumn = { 80, 100, 120 }
opt.cursorline = true
opt.expandtab = true
opt.guicursor = ""
opt.hlsearch = true
opt.incsearch = true
opt.isfname:append "@-@"
opt.list = true
opt.listchars = "tab:> ,lead:·,trail: ,extends:⇢,precedes:⇠,nbsp:+"
opt.mouse = ""
opt.nu = true
opt.relativenumber = true
opt.scrolloff = 8
opt.shiftwidth = 4
opt.signcolumn = "yes"
opt.smartindent = true
opt.softtabstop = 4
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.tabstop = 4
opt.termguicolors = true
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.updatetime = 100
opt.wrap = false
opt.conceallevel = 2
opt.nrformats = 'bin,hex,alpha'

vim.api.nvim_create_autocmd('BufReadPost', {
  desc = 'Open file at the last position it was edited earlier',
  group = misc_augroup,
  pattern = "*",
  command = 'silent! normal! g`"zv'
})

-- "Don't want to automatically insert comment leaders after using `o` in normal
-- mode.  Doesn't work without the autocmd for some freak reason." - Typesafety
cmd [[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o formatoptions+=j formatoptions+=q]]


