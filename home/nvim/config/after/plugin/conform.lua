local conform = require("conform")

conform.toggle_autoformat = function()
	vim.g.disable_autoformat = not vim.g.disable_autoformat
	local is_disabled = function()
		if vim.g.disable_autoformat then
			return "OFF"
		else
            vim.g.disable_autoformat = false
			return "ON"
		end
	end
	vim.notify("Auto format: " .. is_disabled(), vim.log.levels.WARN)
end

conform.setup({
	format_on_save = function(bufnr)
		-- Disable with a global or buffer-local variable
		vim.g.disable_autoformat = true
		if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
			return
		end
		return { timeout_ms = 500, lsp_fallback = true }
	end,
	formatters = {
		erlfmt = {
			meta = {
				url = "https://github.com/WhatsApp/erlfmt",
				description = "Format erlang files with erlfmt",
			},
			command = "erlfmt",
			args = { "$FILENAME" },
		},
	},
	formatters_by_ft = {
		lua = { "stylua" },
		cabal = { "cabal_fmt" },
		haskell = { "fourmolu" },
		go = { "gofmt" },
		rust = { "rustfmt" },
		typst = { "typstfmt" },
		nix = { "nixfmt" },
		python = { "black" },
		c = { "clang_format" },
		erlang = { "erlfmt" },
		["*"] = { "trim_whitespace" },
	},
})

vim.keymap.set("n", "<leader>cf", conform.format)
vim.keymap.set("n", "<leader>cc", conform.toggle_autoformat)
