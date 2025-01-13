local toggleterm = require("toggleterm")
local Terminal = require("toggleterm.terminal").Terminal

toggleterm.setup({ start_in_insert = true })

vim.keymap.set("n", "<leader>ff", function()
	toggleterm.toggle(1)
end)

vim.keymap.set("v", "<C-c>", function()
	toggleterm.send_lines_to_terminal("visual_selection", true, {})
end)

local repl_command = function(cmd)
	return Terminal:new({ count = 999, cmd = cmd, hidden = true })
end

local haskell_cmd = nil
local python_cmd = nil

local config = {
	python = function()
		if python_cmd == nil then
			python_cmd = "python3 -i " .. vim.fn.expand("%")
		end
		local repl = repl_command(python_cmd)
        repl:shutdown()
        repl = repl_command(python_cmd)
        repl:open()
	end,
	haskell = function()
		if haskell_cmd == nil then
			haskell_cmd = vim.fn.input("Command: ")
		end
		local repl = repl_command(haskell_cmd)
		if repl:is_open() then
			repl:send(":r", true)
			repl:clear()
			repl:focus()
		else
			repl:open()
		end
	end,
}

vim.keymap.set("n", "<leader><leader>", function()
	local action = config[vim.bo.filetype]
	config["toggleterm"] = action
	if action ~= nil then
		action()
	else
		return
	end
end)
