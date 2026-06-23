local toggleterm = require("toggleterm")
local Terminal = require("toggleterm.terminal").Terminal
toggleterm.setup({
	start_in_insert = true,
	shade_terminals = false,
    shading_factor = 0,
    shading_ratio = 0,
})

vim.keymap.set("n", "<leader>ff", function()
	toggleterm.toggle(1)
end)

vim.keymap.set("v", "<C-c>", function()
	toggleterm.send_lines_to_terminal("visual_selection", true, {})
end)

