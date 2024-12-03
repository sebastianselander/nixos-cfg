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
		capabilities = capabilities,
	},
}
