
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

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 300 })
		if vim.v.event.operator == "y" then
			for i = 9, 1, -1 do
				vim.fn.setreg(tostring(i), vim.fn.getreg(tostring(i - 1)))
			end
		end
	end,
})

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

-- change line number based on mode:
-- for command mode: make it absolute for ranges etc
-- for normal mode: relative movements <3
local cmdline_group = vim.api.nvim_create_augroup("CmdlineLinenr", {})
-- debounce cmdline enter events to make sure we dont have flickering for non user cmdline use
-- e.g. mappings using : instead of <cmd>
local cmdline_debounce_timer

vim.api.nvim_create_autocmd("CmdlineEnter", {
	group = cmdline_group,
	callback = function()
		cmdline_debounce_timer = vim.uv.new_timer()
		cmdline_debounce_timer:start(
			100,
			0,
			vim.schedule_wrap(function()
				if vim.o.number then
					vim.o.relativenumber = false
					vim.api.nvim__redraw({ statuscolumn = true })
				end
			end)
		)
	end,
})

vim.api.nvim_create_autocmd("CmdlineLeave", {
	group = cmdline_group,
	callback = function()
		if cmdline_debounce_timer then
			cmdline_debounce_timer:stop()
			cmdline_debounce_timer = nil
		end
		if vim.o.number then
			vim.o.relativenumber = true
		end
	end,
})


local reverse = function(line1, line2, no_range)
    if no_range then
        return
    end
    local lines = vim.api.nvim_buf_get_lines(0, line1-1, line2, false)
    local reversed = {}
    for i=1, #lines do
        reversed[#lines-i+1] = lines[i]
    end
    vim.api.nvim_buf_set_lines(0, math.max(line1-1,0), line2, false, reversed)
end

vim.api.nvim_create_user_command("Reverse", function(opts) reverse(opts.line1, opts.line2, opts.range == 0) end, {range = true})
