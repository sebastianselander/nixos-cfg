---- REMAPS -------------------------------------------------------------------
vim.g.mapleader = ' '

vim.keymap.set('n', '<space>', '<Nop>')
vim.keymap.set('n', '<esc>', vim.cmd.noh)
vim.keymap.set('n', 'J', 'mzJ`zdmz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'Y', 'yg$')

-- Tabs.
vim.keymap.set('n', '<leader>1', '1gt')
vim.keymap.set('n', '<leader>2', '2gt')
vim.keymap.set('n', '<leader>3', '3gt')
vim.keymap.set('n', '<leader>4', '4gt')
vim.keymap.set('n', '<leader>5', '5gt')
vim.keymap.set('n', '<leader>6', '6gt')
vim.keymap.set('n', '<leader>7', '7gt')
vim.keymap.set('n', '<leader>8', '8gt')
vim.keymap.set('n', '<leader>9', '9gt')

vim.keymap.set('n', '<leader>tn', '<cmd> tabnew % <CR> <cmd> tabm <CR>')
vim.keymap.set('n', '<leader>tm', '<cmd> tabm 0 <CR>')

vim.keymap.set('t', '<Esc>', "<C-\\><C-n>")

-- Windows.
vim.keymap.set('n', '<A-l>', '<C-w>l')
vim.keymap.set('n', '<A-h>', '<C-w>h')
vim.keymap.set('n', '<A-k>', '<C-w>k')
vim.keymap.set('n', '<A-j>', '<C-w>j')
vim.keymap.set('n', '<A-w>', '<C-w>+')
vim.keymap.set('n', '<A-s>', '<C-w>-')
vim.keymap.set('n', '<A-a>', '<C-w>>')
vim.keymap.set('n', '<A-d>', '<C-w><')

-- Nice
vim.keymap.set('x', '<leader>p', '\"_dP')

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

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
