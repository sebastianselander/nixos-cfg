local snacks = require("snacks")

local layouts = { "ivy", "left", "right", "bottom", "telescope", "vscode", "default" }

local idx = 1

local default_layout = function()
	return layouts[idx]
end

local next_layout = function(picker)
	idx = idx % #layouts + 1
	picker:set_layout(layouts[idx])
end

function get_visual_selection_text()
  local _, srow, scol = unpack(vim.fn.getpos('v'))
  local _, erow, ecol = unpack(vim.fn.getpos('.'))

  -- visual line mode
  if vim.fn.mode() == 'V' then
    if srow > erow then
      return vim.api.nvim_buf_get_lines(0, erow - 1, srow, true)
    else
      return vim.api.nvim_buf_get_lines(0, srow - 1, erow, true)
    end
  end

  -- regular visual mode
  if vim.fn.mode() == 'v' then
    if srow < erow or (srow == erow and scol <= ecol) then
      return vim.api.nvim_buf_get_text(0, srow - 1, scol - 1, erow - 1, ecol, {})
    else
      return vim.api.nvim_buf_get_text(0, erow - 1, ecol - 1, srow - 1, scol, {})
    end
  end

  -- visual block mode
  if vim.fn.mode() == '\22' then
    local lines = {}
    if srow > erow then
      srow, erow = erow, srow
    end
    if scol > ecol then
      scol, ecol = ecol, scol
    end
    for i = srow, erow do
      table.insert(
        lines,
        vim.api.nvim_buf_get_text(0, i - 1, math.min(scol - 1, ecol), i - 1, math.max(scol - 1, ecol), {})[1]
      )
    end
    return lines
  end

end

snacks.setup({
	bigfile = { enabled = true },
	bufdelete = { enabled = true },
	quickfile = { enabled = true },
	zen = {
		toggles = {
			dim = false,
		},
		win = {
			backdrop = {
				transparent = false,
			},
		},
		enabled = true,
	},
	input = { enabled = true },
	dim = {
		enabled = true,
		animate = {
			duration = {
				step = 0,
				total = 0,
			},
		},
	},
	gitbrowse = { enabled = true },
	image = {
		doc = {
			inline = false,
		},
		enabled = false,
	},
	explorer = { enabled = true },
	picker = {
		win = {
			input = {
				keys = {
					["<c-l>"] = { "cycle_layouts", mode = { "i", "n" } },
				},
			},
		},
		actions = {
			cycle_layouts = function(picker)
				next_layout(picker)
			end,
		},
		layout = {
			preset = default_layout(),
		},
		matcher = {
			cwd_bonus = true,
			frecency = true,
		},
		main = {
			current = true,
		},
		enabled = true,
		ui_select = true,
	},
})

vim.api.nvim_create_user_command("Explore", function()
	snacks.explorer()
end, {})

vim.api.nvim_create_user_command("Gitbrowse", function()
	snacks.gitbrowse()
end, {})

vim.keymap.set("n", "<leader>zz", function()
	snacks.zen()
end)

vim.keymap.set("n", "<C-p>", snacks.picker.smart)
vim.keymap.set("n", "<C-l>", snacks.picker.lines)
vim.keymap.set("n", "<leader>p", function()
	snacks.picker()
end)
vim.keymap.set("n", "<leader>.", function()
	snacks.picker.resume({ focus = "list" })
end)
vim.keymap.set("n", "<leader>ps", function() snacks.picker.lsp_symbols({focus = "list"}) end)
vim.keymap.set("n", "<leader>gd", snacks.picker.git_diff)
vim.keymap.set("n", "<leader>/", snacks.picker.grep)
vim.keymap.set("v", "<leader>/", function() 
    local lines = get_visual_selection_text()
    local text = ""
    for _, line in pairs(lines) do
        if text == "" then
            text = text .. line
        else
            text = text .. "\n" .. line
        end
    end
    vim.print(text)
    snacks.picker.grep({regex = false, search = text})
end)
vim.keymap.set("n", "<leader>g/", snacks.picker.git_grep)
vim.keymap.set("n", "<leader>pc", snacks.picker.colorschemes)
vim.keymap.set("n", "<leader>pw", snacks.picker.grep_word)
vim.keymap.set("n", "<leader>pm", snacks.picker.marks)
vim.keymap.set("n", "<leader>pd", snacks.picker.diagnostics)
vim.keymap.set("n", '<leader>"', function()
	snacks.picker.registers({ focus = "list" })
end)
vim.keymap.set("n", "<leader>ph", snacks.picker.help)
vim.keymap.set("n", "<leader>bd", snacks.bufdelete.delete)
