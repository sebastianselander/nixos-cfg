local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>he", function()
	local ui = harpoon.ui
	ui:toggle_quick_menu(harpoon:list())
	local bufnr = ui.bufnr
	vim.keymap.set("n", "q", "<cmd> wq<cr>", { buffer = bufnr })
	vim.keymap.set("n", "d", "cc<esc>", { buffer = bufnr })
	vim.keymap.set("n", "dd", "cc<esc>", { buffer = bufnr })
	vim.api.nvim_create_autocmd({
		"ExitPre",
	}, {
		callback = function()
			vim.cmd("write")
		end,
		buffer = bufnr,
	})
end)

local harpoon_mark_or_select = function(idx)
	if harpoon:list():get(idx) == nil then
		harpoon:list():replace_at(idx)
	else
		harpoon:list():select(idx)
	end
end

for i = 1, 5 do
	vim.keymap.set("n", "<leader>" .. i, function()
		harpoon_mark_or_select(i)
	end)
end
