local snacks = require("snacks")

snacks.setup({
	bigfile = { enabled = true },
	quickfile = { enabled = true },
	zen = { enabled = true },
	input = { enabled = true },
	gitbrowse = { enabled = true },
	-- picker = {
	-- 	main = {
	-- 		current = true,
	-- 	},
	-- 	enabled = true,
	-- },
})

vim.keymap.set("n", "<leader>zz", function()
	snacks.zen()
end)

-- vim.keymap.set("n", "<C-p>", snacks.picker.smart)
-- vim.keymap.set("n", "<leader>ps", snacks.picker.grep)
-- vim.keymap.set("n", "<leader>pc", snacks.picker.colorschemes)
-- vim.keymap.set("n", "<leader>pw", snacks.picker.grep_word)
-- vim.keymap.set("n", "<leader>b", function()
-- 	snacks.picker.buffers({ current = false, sort_lastused = true })
-- end, { desc = "Buffers" })
-- vim.keymap.set("n", "<leader>pm", snacks.picker.marks)
-- vim.keymap.set("n", "<leader>pd", snacks.picker.diagnostics)
-- vim.keymap.set("n", '<leader>"', snacks.picker.registers)
-- vim.keymap.set("n", "<F1>", snacks.picker.help)
