local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		haskell = { "stylish-haskell" },
		go = { "gofmt" },
		rust = { "rustfmt" },
		typst = { "typstfmt" },
		nix = { "nixfmt" },
		python = { "black" },
		["*"] = { "trim_whitespace" },
	},
})

vim.keymap.set("n", "<leader>cf", conform.format)
