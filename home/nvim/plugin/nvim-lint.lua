require("lint").linters_by_ft = {
	haskell = { "hlint" },
	lua = { "luacheck" },
	c = { "cpplint" },
	python = { "ruff" },
	markdown = { "markdownlint" },
	rust = { "rust-clippy" },
	go = { "golint" },
	nix = { "nixpkgs-lint" },
}
