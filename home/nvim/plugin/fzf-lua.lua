local fzf = require("fzf-lua")
fzf.setup({})

vim.keymap.set("n", "<C-p>", fzf.files)
vim.keymap.set("n", "<leader>ps", fzf.live_grep)
vim.keymap.set("n", "<leader>b", function()
    -- Show only buffer path
	fzf.buffers({ fzf_opts = { ["--with-nth"] = "3.." } })
end)
vim.keymap.set("n", "<leader>pm", fzf.marks)
vim.keymap.set("n", "<leader>pd", fzf.diagnostics_document)
vim.keymap.set("n", '<leader>"', fzf.registers)
