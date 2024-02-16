vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Swap between .c and .h file
local header_normal_swap = function()
	local path = vim.fn.expand("%:h") .. "/"
	local extension = vim.fn.expand("%:e")
	local file = vim.fn.expand("%:t:r")

	if extension ~= "c" or extension ~= "h" then
		return
	end

	if extension == "c" then
		extension = ".h"
	else
		if extension == "h" then
			extension = ".c"
		end
	end
	vim.cmd("edit " .. path .. file .. extension)
end

vim.keymap.set("n", "<leader><leader>", header_normal_swap)
