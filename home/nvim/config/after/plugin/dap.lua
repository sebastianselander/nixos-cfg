local dap = require("dap")
local ui = require("dapui")
local vt = require("nvim-dap-virtual-text")

ui.setup()

vt.setup()

vim.keymap.set("n", "<leader>xx", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>xc", dap.run_to_cursor)

vim.keymap.set("n", "<leader>?", function()
	ui.eval(nil, { enter = true })
end)

vim.keymap.set("n", "<F1>", dap.continue)
vim.keymap.set("n", "<F2>", dap.step_into)
vim.keymap.set("n", "<F3>", dap.step_over)
vim.keymap.set("n", "<F4>", dap.step_out)
vim.keymap.set("n", "<F5>", dap.step_back)
vim.keymap.set("n", "<F9>", dap.step_back)

dap.listeners.before.attach.dapui_config = ui.open
dap.listeners.before.launch.dapui_config = ui.open
dap.listeners.before.event_terminated.dapui_config = ui.close
dap.listeners.before.event_exited.dapui_config = ui.close

dap.adapters.python = function(callback, config)
	local adapter = {
		type = "executable",
		command = "python3",
		args = { "-m", "debugpy.adapter" },
		options = {
			source_filtype = "python",
		},
	}
	callback(adapter)
end

dap.adapters.debugpy = dap.adapters.python

dap.configurations.python = {
	{
		type = "python",
		request = "launch",
		name = "file",
		program = "${file}",
	},
	{
		type = "python",
		request = "launch",
		name = "file:args",
		program = "${file}",
	},
	{
		type = "python",
		request = "attach",
		name = "attach",
		connect = function()
			local host = vim.fn.input("Host [127.0.0.1]: ")
			host = host ~= "" and host or "127.0.0.1"
			local port = tonumber(vim.fn.input("Port [5678]: ")) or 5678
			return { host = host, port = port }
		end,
	},
    {
        type = 'python',
        request = 'launch';
        name = 'file:doctest',
        module = 'doctest',
        args = { "${file}" },
        noDebug = true,
    }
}
