local fzf = require("fzf-lua")
fzf.setup({
	winopts = {
		preview = {
			layout = "flex",
			flip_columns = 140,
		},
		buffers = {
			exclude_current = true,
		},
        files = {
            exclude_current = true,
        },
	},
})

-- vim.keymap.set("n", "<C-p>", fzf.files)
-- vim.keymap.set("n", "<leader>ps", fzf.live_grep)
-- vim.keymap.set("n", "<leader>pw", fzf.grep_cword)
-- vim.keymap.set("n", "<leader>pW", fzf.grep_cWORD)
-- vim.keymap.set("n", "<leader>b", fzf.buffers)
-- vim.keymap.set("n", "<leader>pm", fzf.marks)
-- vim.keymap.set("n", "<leader>pd", fzf.diagnostics_document)
-- vim.keymap.set("n", '<leader>"', fzf.registers)
-- vim.keymap.set("n", "<F1>", fzf.helptags)
