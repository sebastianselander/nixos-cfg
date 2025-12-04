local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.g.rustaceanvim = {
	server = {
		on_attach = function(client, bufnr)
			local opts = { noremap = true, silent = true, buffer = bufnr }
			vim.keymap.set("n", "<leader>ca", vim.cmd.RustLsp("codeAction"), opts)
			vim.keymap.set("n", "<leader>cl", vim.lsp.codelens.run, opts)
			vim.keymap.set("n", "K", vim.cmd.RustLsp({ "hover", "actions" }), opts)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
			vim.keymap.set("n", "<C-k>", function()
				vim.diagnostic.jump({ count = -1, float = true })
			end, opts)
			vim.keymap.set("n", "<C-j>", function()
				vim.diagnostic.jump({ count = 1, float = true })
			end, opts)
			vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
			vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
			vim.keymap.set("n", "<leader>ll", vim.diagnostic.setloclist, opts)
		end,
	},
}
