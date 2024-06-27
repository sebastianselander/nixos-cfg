local fzf = require("fzf-lua")
fzf.setup({
	winopts = {
		preview = {
			layout = "flex",
			flip_columns = 140,
		},
	},
})

vim.keymap.set("n", "<C-p>", function()
	local fzfutils = require("fzf-lua.utils")
	fzf.files({
		winopts = {
			preview = {
				hidden = "hidden",
			},
		},
		cmd = string.format(
			[[fd --color=never --type f --hidden --follow --exclude .git -x printf "{}: {/} %s\n"]],
			fzfutils.ansi_codes.grey("{//}")
		),
		fzf_opts = {
			["--ansi"] = "",
			["--with-nth"] = "2..",
			["--delimiter"] = "\\s",
			["--tiebreak"] = "begin,index",
		},
		ignore_current_file = true,
	})
end)
-- vim.keymap.set("n", "<leader>ps", fzf.live_grep)
-- vim.keymap.set("n", "<leader>pw", fzf.grep_cword)
-- vim.keymap.set("n", "<leader>pW", fzf.grep_cWORD)
-- vim.keymap.set("n", "<leader>b", function()
-- 	-- Show only buffer path
-- 	fzf.buffers({
-- 		winopts = {
-- 			fullscreen = false,
-- 			height = 0.35,
-- 			width = 0.55,
-- 			preview = {
-- 				hidden = "hidden",
-- 			},
-- 		},
-- 		fzf_opts = {
-- 			["--with-nth"] = "-1",
-- 		},
-- 	})
-- end)
-- vim.keymap.set("n", "<leader>pm", fzf.marks)
-- vim.keymap.set("n", "<leader>pd", fzf.diagnostics_document)
-- vim.keymap.set("n", '<leader>"', fzf.registers)
