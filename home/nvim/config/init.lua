---- REMAPS -------------------------------------------------------------------
local g = vim.g
local o = vim.o

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
nmap("Y", "yg_")

vmap("gA", "$A")

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

local remove_text_on_line = function()
	local remove = vim.fn.input("Remove: ")
	if remove ~= "" and remove ~= nil then
		vim.cmd(":s/" .. remove .. "//g")
		vim.cmd(":noh")
	end
end

nmap("<leader>sd", remove_text_on_line)

local sub_under_cursor = function(modifier)
	modifier = modifier or ""
	local word_under_cursor = vim.fn.escape(vim.fn.expand("<cword>"), [[\/]])
	-- TODO: Use vim.ui.input
	local to = vim.fn.input("Substitute '" .. word_under_cursor .. "' with: ")
	if word_under_cursor ~= nil and word_under_cursor ~= "" and to ~= nil and to ~= "" then
		vim.cmd("norm mz")
		vim.cmd(":" .. modifier .. "s/\\<" .. word_under_cursor .. "\\>/" .. to .. "/gIc")
		vim.cmd(":noh")
		vim.cmd("norm `zzz")
	end
end

nmap("<leader>sl", function()
	sub_under_cursor()
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
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=300 }
  augroup END
]])

---- SET ----------------------------------------------------------------------

o.cmdheight = 1

g.netrw_bufsettings = "noma nomod nu nowrap ro nobl"

vim.opt.backup = false
vim.opt.colorcolumn = { 100 }
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.guicursor =
	"n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.isfname:append("@-@")
vim.opt.list = true
vim.opt.listchars = { nbsp = "␣", tab = "> " }
vim.opt.mouse = ""
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
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
vim.opt.updatetime = 250
vim.opt.wrap = false
vim.opt.conceallevel = 2
vim.opt.nrformats = "bin,hex"
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.timeoutlen = 400
vim.opt.inccommand = "split"
vim.opt.jumpoptions = "stack,view"

vim.api.nvim_create_autocmd("FileType", {
	desc = "Change some formatoptions",
	pattern = "*",
	callback = function()
		vim.opt.formatoptions:append({ "j", "q" })
		vim.opt.formatoptions:remove({ "c", "o", "r" })
	end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
	desc = "Open file at the last position it was edited earlier",
	pattern = "*",
	command = 'silent! normal! g`"zv',
})

vim.api.nvim_create_autocmd("BufReadPost", {
	desc = "Open file at the last position it was edited earlier",
	pattern = "*",
	command = 'silent! normal! g`"zv',
})

-- Set filetype to typst on entering a file that end in .typ

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.typ" },
	command = "set ft=typst",
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.ll" },
	command = "set ft=llvm",
})

-- Sync terminal background with Neovim's
vim.api.nvim_create_autocmd({ "UIEnter", "ColorScheme" }, {
	callback = function()
		local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
		if not normal.bg then
			return
		end
		io.write(string.format("\027]11;#%06x\027\\", normal.bg))
	end,
})

vim.api.nvim_create_autocmd("UILeave", {
	callback = function()
		io.write("\027]111\027\\")
	end,
})
