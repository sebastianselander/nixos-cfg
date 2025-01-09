vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
	callback = function()
		vim.opt.number = false
		vim.opt.relativenumber = false
	end,
})

vim.keymap.set("t", "<esc><esc>", "<C-\\><C-n>")

local state = {
	buf = -1,
	win = -1,
	job_id = -1,
	task = nil,
}

local scroll_to_end = function(bufnr)
	local cur_win = vim.api.nvim_get_current_win()
	-- switch to buf and set cursor
	vim.api.nvim_buf_call(bufnr, function()
		local target_win = vim.api.nvim_get_current_win()
		vim.api.nvim_set_current_win(target_win)

		local target_line = vim.tbl_count(vim.api.nvim_buf_get_lines(0, 0, -1, true))
		vim.api.nvim_win_set_cursor(target_win, { target_line, 0 })
	end)

	-- return to original window
	vim.api.nvim_set_current_win(cur_win)
end

local create_window = function(opts)
	opts = opts or {}

	local buf = nil
	if vim.api.nvim_buf_is_valid(opts.buf) then
		buf = opts.buf
	else
		buf = vim.api.nvim_create_buf(false, true)
	end

	local win_config = {
		height = math.floor(vim.o.lines * 0.25),
		style = "minimal",
		split = "below",
	}
	local win = vim.api.nvim_open_win(buf, true, win_config)
	return { win = win, buf = buf, job_id = state.job_id, task = state.task }
end

local toggle_terminal = function()
	if not vim.api.nvim_win_is_valid(state.win) then
		state = create_window({ buf = state.buf, job_id = state.job_id })
		if vim.bo[state.buf].buftype ~= "terminal" then
			vim.cmd.terminal()
			state.job_id = vim.bo.channel
		end
	else
		vim.api.nvim_win_hide(state.win)
	end
end

local create_task = function()
	local default = ""
	if state.task ~= nil then
		default = state.task
	end
	vim.ui.input({ prompt = "Job: ", default = default }, function(input)
		if input ~= nil then
			state.task = input
		end
	end)
end

local run_task = function()
	if state.task == nil then
		vim.notify("No task found", vim.log.levels.WARN)
	else
		if state.job_id == -1 then
			vim.notify("Invaild job id", vim.log.levels.WARN)
		else
			if not vim.api.nvim_win_is_valid(state.win) then
				state = create_window({ buf = state.buf, job_id = state.job_id })
			end
			vim.fn.chansend(state.job_id, { state.task .. "\r" })
			scroll_to_end(state.buf)
		end
	end
end

local cancel_job = function()
	if state.job_id == -1 then
		vim.notify("Invaild job id", vim.log.levels.WARN)
	else
		vim.fn.chansend(state.job_id, { "\r" })
		scroll_to_end(state.buf)
	end
end
