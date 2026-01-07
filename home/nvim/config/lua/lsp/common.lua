-- lua/lsp/common.lua
local M = {}

-- Advertise completion capabilities to servers
local cmp_caps = require("cmp_nvim_lsp").default_capabilities()
cmp_caps.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}
M.capabilities = cmp_caps

M.on_attach = function(_, bufnr)
	local map = function(mode, lhs, rhs, desc)
		vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
	end
    map("n", "<leader>cl", vim.lsp.codelens.run, "Code lens")
	map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
	map("n", "K", vim.lsp.buf.hover, "Hover")
	map("n", "gd", vim.lsp.buf.definition, "Go to definition")
	map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
	map("n", "gr", vim.lsp.buf.references, "References")
	map("n", "gi", vim.lsp.buf.implementation, "Implementation")
	map("n", "K", function() vim.lsp.buf.hover({ border = "rounded"}) end, "Hover")
	map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
	map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
	map("n", "gT", vim.lsp.buf.type_definition, "Go to type definition")
	map("n", "<C-k>", function()
		vim.diagnostic.jump({ count = -1, float = true })
	end, "Next diagnostic")
	map("n", "<C-j>", function()
		vim.diagnostic.jump({ count = 1, float = true })
	end, "Prev diagnostic")
	map("n", "[d", function()
		vim.diagnostic.jump({ count = -1, float = true })
	end, "Next diagnostic")
	map("n", "]d", function()
		vim.diagnostic.jump({ count = 1, float = true })
	end, "Prev diagnostic")
	map("n", "<leader>d", vim.diagnostic.open_float, "Line diagnostics")
end

return M
