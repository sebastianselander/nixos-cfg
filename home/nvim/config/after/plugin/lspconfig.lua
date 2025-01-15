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

local nvim_lsp = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local on_attach = function(_, _)
	local opts = { noremap = true, silent = true, buffer = 0 }
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "gR", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "<C-k>", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "<C-j>", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "<leader>ll", vim.diagnostic.setloclist, opts)
	vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
end

local default = {
	on_attach = on_attach,
	capabilities = capabilities,
}

require("lean").setup({
	lsp = default,
	mappings = true,
})

local union = function(t1, t2)
	return vim.tbl_deep_extend("error", t1, t2)
end

-- nvim_lsp.hls.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	settings = {
-- 		haskell = {
-- 			plugin = {
--                 rename = {
--                     globalOn = true,
--                     config = {
--                         diff = true,
--                     },
--                 },
--                 eval = {
--                     globalOn = true,
--                 },
-- 				changeTypeSignature = {
-- 					globalOn = true,
-- 				},
-- 				gadt = {
-- 					globalOn = false,
-- 				},
-- 				alternateNumberFormat = {
-- 					globalOn = false,
-- 				},
-- 				class = {
-- 					globalOn = true,
-- 				},
--                 splice = {
--                     globalOn = true,
--                 }
-- 			},
-- 		},
-- 	},
-- })

nvim_lsp.erlangls.setup(default)
nvim_lsp.pyright.setup(default)
nvim_lsp.rust_analyzer.setup(default)
nvim_lsp.lua_ls.setup(default)
nvim_lsp.gopls.setup(default)
nvim_lsp.marksman.setup(default)
nvim_lsp.ccls.setup(default)
nvim_lsp.nil_ls.setup(default)
nvim_lsp.tinymist.setup(union(default, { offset_encoding = "utf-8" }))
nvim_lsp.clangd.setup(default)

nvim_lsp.dafny.setup(default)

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = false,
	signs = true,
	update_in_insert = false,
	underline = true,
	border = "single",
	severity_sort = true,
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "single",
})
