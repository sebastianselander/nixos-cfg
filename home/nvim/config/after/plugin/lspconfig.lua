-- Must be setup before lspconfig
require("neodev").setup({
	library = {
		enabled = true,
		runtime = true,
		types = true,
		plugins = true,
	},
	setup_jsonls = true,
	override = function(root_dir, options)
		if root_dir:find("/home/sebastian/Documents/git/nixos-cfg", 1, true) == 1 then
			options.enabled = true
			options.plugins = true
		end
	end,
	lspconfig = true,
	pathStrict = true,
})

local default_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require("cmp_nvim_lsp").default_capabilities(default_capabilities)

capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

local on_attach = function(_, _)
	local opts = { noremap = true, silent = true, buffer = 0 }
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover({ border = "single" })
	end, opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "gR", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "<C-k>", function()
		vim.diagnostic.jump({ count = -1, float = true })
	end, opts)
	vim.keymap.set("n", "<C-j>", function()
		vim.diagnostic.jump({ count = 1, float = true })
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.jump({ count = -1, float = true })
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.jump({ count = 1, float = true })
	end, opts)
	vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "<leader>ll", vim.diagnostic.setloclist, opts)
	vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
end

local union = function(t1, t2)
	return vim.tbl_deep_extend("error", t1, t2)
end

local lsps = {
	"erlangls",
	"pyright",
	"rust_analyzer",
	"lua_ls",
	"gopls",
	"marksman",
	"ccls",
	"nil_ls",
	"tinymist",
	"clangd",
}

for _, lsp in ipairs(lsps) do
	local default = {
		on_attach = on_attach,
		capabilities = capabilities,
	}
	if lsp == "tinymist" then
		vim.lsp.config(lsp, union(default, { offset_encoding = "utf-8" }))
	else
		vim.lsp.config(lsp, default)
	end
end

vim.lsp.enable(lsps)

vim.diagnostic.config({
	float = { border = "rounded" },
	virtual_text = false,
	signs = true,
	update_in_insert = false,
	underline = true,
	severity_sort = true,
})
