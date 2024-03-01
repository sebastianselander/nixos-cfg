local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		haskell = { "fourmolu" },
		go = { "gofmt" },
		rust = { "rustfmt" },
		typst = { "typstfmt" },
		nix = { "nixfmt" },
		python = { "black" },
        c = { "clang_format" },
		["*"] = { "trim_whitespace" },
	},
})

vim.keymap.set("n", "<leader>cf", conform.format)
