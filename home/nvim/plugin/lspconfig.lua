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
	capabilities = capabilities,
}

local union = function(t1, t2)
	return vim.tbl_deep_extend("error", t1, t2)
end

nvim_lsp.hls.setup(default)
nvim_lsp.rust_analyzer.setup({
	on_attach = on_attach,
	settings = {
		["rust-analyzer"] = {
			imports = {
				granularity = {
					group = "module",
				},
				prefix = "self",
			},
			cargo = {
				buildScripts = {
					enable = true,
				},
			},
			procMacro = {
				enable = true,
			},
		},
	},
})
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
	update_in_insert = false,
	underline = true,
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "single",
})

local echo_diagnostic = function()
	local line = vim.fn.line(".") - 1
	local bufnr = vim.api.nvim_win_get_buf(0)

	local diags = vim.diagnostic.get(bufnr, { lnum = line, end_lnum = line, severity_limit = "Warning" })

	if #diags == 0 then
		vim.api.nvim_command('echo ""')
		return
	end

	local diag = diags[1]
	local width = vim.api.nvim_get_option("columns") - 15
	local lines = vim.split(diag.message, "\n")
	local message = lines[1]

	if #lines > 1 and #message <= 20 then
		message = message .. " " .. lines[2]
	end

	if width > 0 and #message >= width then
		message = message:sub(1, width) .. "..."
	end

	local kind = "warning"
	local hlgroup = "WarningMsg"

	if diag.severity == vim.lsp.protocol.DiagnosticSeverity.Error then
		kind = "error"
		hlgroup = "ErrorMsg"
	end

	local chunks = {
		{ kind .. ": ", hlgroup },
		{ message },
	}

	vim.api.nvim_echo(chunks, false, {})
end

vim.api.nvim_create_autocmd("CursorMoved", {
	desc = "Lsp diagnostics",
	group = misc_augroup,
	pattern = "*",
	callback = echo_diagnostic,
})
