local lualine = require("lualine")

local show_macro_recording = function()
	local recording = vim.fn.reg_recording()
	if recording == "" then
		return ""
	else
		return "Recording @" .. recording
	end
end

lualine.setup({
	sections = {
		lualine_b = {
			{
				"macro-recording",
				fmt = show_macro_recording,
			},
		},
	},
	options = {
		theme = "tokyonight",
	},
})

vim.api.nvim_create_autocmd("RecordingEnter", {
	callback = function()
		lualine.refresh({
			place = { "statusline" },
		})
	end,
})

vim.api.nvim_create_autocmd("RecordingLeave", {
	callback = function()
		lualine.refresh({
			place = { "statusline" },
		})
	end,
})
