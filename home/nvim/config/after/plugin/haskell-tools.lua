local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.g.haskell_tools = {
	tools = {
		codeLens = {
			autoRefresh = true,
		},
		definition = {
			hoogle_signature_fallback = true,
		},
	},
	hls = {
		settings = {
			haskell = {
				plugin = {
					moduleName = {
						globalOn = false,
					},
				},
			},
		},
		on_attach = function(_, bufnr, ht)
			local opts = { noremap = true, silent = true, buffer = bufnr }
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "<leader>cl", vim.lsp.codelens_run, opts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
			vim.keymap.set("n", "<C-k>", vim.diagnostic.goto_prev, opts)
			vim.keymap.set("n", "<C-j>", vim.diagnostic.goto_next, opts)
			vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
			vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

			vim.keymap.set("n", "<leader>hs", ht.hoogle.hoogle_signature, opts)
			vim.keymap.set("n", "<leader>ea", ht.lsp.buf_eval_all, opts)
			vim.keymap.set("n", "<leader>rr", ht.repl.toggle, opts)
			vim.keymap.set("n", "<leader>rq", ht.repl.quit, opts)
			vim.keymap.set("n", "<leader>cp", ht.project.open_package_cabal, opts)
		end,
		capabilities = capabilities,
	},
}
