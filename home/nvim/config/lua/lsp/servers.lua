local common = require("lsp.common")

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf
		local client = vim.lsp.get_client_by_id(args.data.client_id)

		if client and client:supports_method("textDocument/codeLens") then
			vim.lsp.codelens.refresh()
			vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
				buffer = bufnr,
				callback = vim.lsp.codelens.refresh,
			})
		end
	end,
})

local lsp_setup = function(server, opts)
	opts = opts or {}
	opts.capabilities = common.capabilities
	opts.on_attach = common.on_attach
	vim.lsp.config(server, opts)
	vim.lsp.enable(server)
end

lsp_setup("rust_analyzer", {
	settings = {
		["rust-analyzer"] = { cargo = { allFeatures = true } },
	},
})

lsp_setup("basedpyright", {
    filestypes = { "python" },
	root_markers = {
		"pyproject.toml",
		"setup.py",
		"setup.cfg",
		"requirements.txt",
		"Pipfile",
		"pyrightconfig.json",
		".git",
	},
	settings = {
		basedpyright = {
			analysis = {
				diagnosticMode = "openFilesOnly",
				useLibraryCodeForTypes = true,
				autoSearchPaths = true,
				typeCheckingMode = "basic",
			},
		},
	},
})

lsp_setup("hls", {
	haskell = {
		maxCompletions = 40,
		checkParents = "CheckOnSave",
		plugin = {
			callHierarchy = { globalOn = true },
			class = {
				codeActionsOn = true,
				codeLensOn = true,
			},
			rename = {
				globalOn = true,
				config = {
					crossModule = true,
				},
			},
			retrie = { globalOn = true },
			splice = {
				globalOn = true,
				codeActionsOn = true,
				codeLensOn = true,
			},
			moduleName = {
				globalOn = false,
			},
			eval = {
				globalOn = true,
				config = {
					diff = true,
					exception = true,
				},
			},
			importLens = {
				globalOn = true,
				codeActionsOn = true,
				codeLensOn = true,
			},
			refineImports = {
				globalOn = true,
				codeActionsOn = true,
				codeLensOn = true,
			},
		},
	},
})

lsp_setup("gopls")
lsp_setup("marksman")
lsp_setup("ccls")
lsp_setup("nil_ls")
lsp_setup("clangd")
lsp_setup("ccls")
lsp_setup("tinymist", {
	offset_encoding = "utf-8",
})
lsp_setup("lua_ls", {
	settings = {
		Lua = {
			workspace = { checkThirdParty = false },
			diagnostics = { globals = { "vim" } },
			telemetry = { enable = false },
		},
	},
})
