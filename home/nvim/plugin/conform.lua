local conform = require("conform")

conform.setup({
    formatters = {
        cabal_fmt = {
            meta = {
                url = "https://hackage.haskell.org/package/cabal-fmt",
                description = "Format cabal files with cabal-fmt",
            },
            command = "cabal-fmt",
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
		["*"] = { "trim_whitespace" },
	},
})

vim.keymap.set("n", "<leader>cf", conform.format)
