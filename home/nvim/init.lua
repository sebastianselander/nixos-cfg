---- REMAPS -------------------------------------------------------------------
local g = vim.g
local o = vim.o
local opt = vim.opt
local cmd = vim.cmd
local api = vim.api

local tmap = function(from, to)
	vim.keymap.set("t", from, to)
end

local vmap = function(from, to)
	vim.keymap.set("v", from, to)
end

local nmap = function(from, to)
	vim.keymap.set("n", from, to)
end

vim.g.mapleader = " "

nmap("<space>", "<Nop>")
nmap("<esc>", vim.cmd.noh)
nmap("J", "mzJ`zdmz")
nmap("<C-d>", "<C-d>zz")
nmap("<C-u>", "<C-u>zz")
nmap("N", "Nzzzv")
nmap("n", "nzzzv")
nmap("Y", "yg$")


tmap("<Esc>", "<C-\\><C-n>")

-- Windows.
nmap("<A-l>", "<C-w>l")
nmap("<A-h>", "<C-w>h")
nmap("<A-k>", "<C-w>k")
nmap("<A-j>", "<C-w>j")
nmap("<A-w>", "<C-w>+")
nmap("<A-s>", "<C-w>-")
nmap("<A-a>", "<C-w>>")
nmap("<A-d>", "<C-w><")

local sub_under_cursor = function(modifier)
	local word_under_cursor = vim.fn.escape(vim.fn.expand("<cword>"), [[\/]])
	local to = vim.fn.input("Substitute '" .. word_under_cursor .. "' with: ")
	if word_under_cursor ~= nil and word_under_cursor ~= "" and to ~= nil and to ~= "" then
		cmd(":" .. modifier .. "s/\\<" .. word_under_cursor .. "\\>/" .. to .. "/gIc")
		cmd(":noh")
	end
end

nmap("<leader>sl", function()
	sub_under_cursor("")
end)

nmap("<leader>ss", function()
	sub_under_cursor("%")
end)

nmap("<leader>w", "<Cmd>w<CR>")

vmap(".", ":norm .<CR>")

for c in ("abcdefghijklmnopqrstuvwxyz"):gmatch(".") do
	vmap("@" .. c, ":norm @" .. c .. "<CR>")
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
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=300 }
  augroup END
]])

---- SET ----------------------------------------------------------------------

o.cmdheight = 1

g.netrw_bufsettings = "noma nomod nu nowrap ro nobl"

opt.backup = false
opt.colorcolumn = { 80, 100, 120 }
opt.cursorline = true
opt.expandtab = true
opt.guicursor = ""
opt.hlsearch = true
opt.incsearch = true
opt.isfname:append("@-@")
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
opt.nrformats = "bin,hex"

api.nvim_create_autocmd("BufReadPost", {
	desc = "Open file at the last position it was edited earlier",
	group = misc_augroup,
	pattern = "*",
	command = 'silent! normal! g`"zv',
})

-- "Don't want to automatically insert comment leaders after using `o` in normal
-- mode.  Doesn't work without the autocmd for some freak reason." - Typesafety
cmd(
	[[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o formatoptions+=j formatoptions+=q]]
)

-- Set filetype to typst on entering a file that end in .typ
api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.typ" },
	command = "set ft=typst",
})
