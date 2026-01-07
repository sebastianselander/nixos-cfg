local harpoon = require("harpoon")
local harpoon_config = require("harpoon.config")
local create_list_item = harpoon_config.get_default_config().default.create_list_item
local Path = require("plenary.path")

local function normalize_path(buf_name, root)
    return Path:new(buf_name):make_relative(root)
end

-- REQUIRED
harpoon:setup()
-- REQUIRED

local previous_buffer = nil

vim.keymap.set("n", ";", function()
	previous_buffer = vim.api.nvim_get_current_buf()
	local ui = harpoon.ui
	ui:toggle_quick_menu(harpoon:list())
	local bufnr = ui.bufnr
	vim.keymap.set("n", "q", "<cmd>wq<cr>", { buffer = bufnr })
	vim.keymap.set("n", "<Esc>", "<cmd>wq<cr>", { buffer = bufnr })
	vim.keymap.set("n", "d", "cc<esc>", { buffer = bufnr })
	vim.keymap.set("n", "a", function()
        if not vim.api.nvim_buf_is_valid(previous_buffer) then
            return
        end
		local path = vim.api.nvim_buf_get_name(previous_buffer)
		local item = create_list_item({}, normalize_path(path, harpoon:list().config.get_root_dir()))
		harpoon:list():add(item)
		ui:toggle_quick_menu(harpoon:list())
		ui:toggle_quick_menu(harpoon:list())
	end, { buffer = bufnr })
    vim.keymap.set("n", "1", function() harpoon:list():select(1) end, {buffer = bufnr})
    vim.keymap.set("n", "2", function() harpoon:list():select(2) end, {buffer = bufnr})
    vim.keymap.set("n", "3", function() harpoon:list():select(3) end, {buffer = bufnr})
    vim.keymap.set("n", "4", function() harpoon:list():select(4) end, {buffer = bufnr})
    vim.keymap.set("n", "5", function() harpoon:list():select(5) end, {buffer = bufnr})
end)
