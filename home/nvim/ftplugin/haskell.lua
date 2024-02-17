vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.bo.makeprg = "cabal run"

local current_file, previous_file = vim.fn.expand("%:p")

local swap_current_cabal = function()
	local cwd = vim.fn.getcwd()
	current_file = vim.fn.expand("%:p")

	local files = io.popen("cd " .. cwd .. "; ls *.cabal"):lines()
	local project_file = nil
    -- Get first .cabal file
	for file in files do
		project_file = cwd .. "/" .. file
		break
	end

	if project_file == nil then
		return
	end

	if current_file == project_file then
		vim.cmd("edit " .. previous_file)
	else
		vim.cmd("edit " .. project_file)
	end
	previous_file = current_file
end

vim.keymap.set("n", "<leader><leader>", swap_current_cabal)
