vim.g.netrw_bufsettings = "noma nomod nu nowrap ro nobl"
vim.opt.backup = false
vim.opt.colorcolumn = "80"
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.guicursor = ""
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.isfname:append"@-@"
vim.opt.list = true
vim.opt.listchars = "tab:> ,lead: ,trail:·,extends:⇢,precedes:⇠,nbsp:+"
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

-- "Don't want to automatically insert comment leaders after using `o` in normal
-- mode.  Doesn't work without the autocmd for some freak reason." - Typesafety
vim.cmd [[ autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o formatoptions+=j formatoptions+=q ]]
