local conform = require("conform")

conform.setup({
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
