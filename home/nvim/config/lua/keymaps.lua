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
nmap("<C-s>", "<cmd>w<CR>")

-- Unfortunately as the autocmd and keymaps share state they have to be in the
-- same file
local cursorPreYank

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		if vim.v.event.operator == "y" and cursorPreYank then
			vim.api.nvim_win_set_cursor(0, cursorPreYank)
		end
	end,
})

vim.keymap.set("n", "Y", function()
	cursorPreYank = vim.api.nvim_win_get_cursor(0)
	return "yg_"
end, { expr = true })

vim.keymap.set("n", "y", function()
	cursorPreYank = vim.api.nvim_win_get_cursor(0)
	return "y"
end, { expr = true })

nmap("Y", "yg_")
-- Windows.
nmap("<A-l>", "<C-w>l")
nmap("<A-h>", "<C-w>h")
nmap("<A-k>", "<C-w>k")
nmap("<A-j>", "<C-w>j")
nmap("<A-w>", "<C-w>+")
nmap("<A-s>", "<C-w>-")
nmap("<A-a>", "<C-w>>")
nmap("<A-d>", "<C-w><")

nmap("gX", vim.ui.open) -- gx is taken by mini.operators

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
