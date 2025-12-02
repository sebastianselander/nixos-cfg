local lint = require("lint")
lint.linters_by_ft = {
	haskell = { "hlint" },
	lua = { "luacheck" },
	c = { "cpplint" },
	python = { "pylint" },
	markdown = { "markdownlint" },
	rust = { "clippy" },
	go = { "golint" },
	nix = { "nixpkgs-lint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave", "FocusGained" }, {
	callback = function()
		vim.defer_fn(lint.try_lint, 1)
	end,
})
