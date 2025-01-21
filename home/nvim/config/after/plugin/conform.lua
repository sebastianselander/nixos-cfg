local conform = require("conform")

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
		typst = { "typstyle" },
		nix = { "nixfmt" },
		python = { "black" },
		c = { "clang_format" },
		cpp = { "clang_format" },
		erlang = { "erlfmt" },
		["*"] = { "trim_whitespace" },
	},
})

vim.keymap.set("n", "<leader>cf", conform.format, {desc = "Format buffer"})
