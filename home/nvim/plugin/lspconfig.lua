local nvim_lsp = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local on_attach = function(_, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "<C-k>", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "<C-j>", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "<leader>ll", vim.diagnostic.setloclist, opts)

	vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
end

local default = {
  on_attach = on_attach,
  capabilities = capabilities
}

local union = function(t1,t2)
  return vim.tbl_deep_extend("error", t1, t2)
end

nvim_lsp.hls.setup(default)
nvim_lsp.rust_analyzer.setup(default)
nvim_lsp.lua_ls.setup(default)
nvim_lsp.gopls.setup(default)
nvim_lsp.marksman.setup(default)
nvim_lsp.ccls.setup(default)
nvim_lsp.nil_ls.setup(default)
nvim_lsp.typst_lsp.setup(union(default, {
	settings = {
		exportPdf = "never",
	},
}))

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = false,
	signs = true,
	update_in_insert = true,
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "single",
})
