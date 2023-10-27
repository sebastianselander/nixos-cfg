local nvim_lsp = require('lspconfig')
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local on_attach = function(client, bufnr)
    local opts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action   , opts)
    vim.keymap.set('n', 'K'         , vim.lsp.buf.hover         , opts)
    vim.keymap.set('n', 'gd'        , vim.lsp.buf.definition    , opts)
    vim.keymap.set('n', 'gD'        , vim.lsp.buf.declaration   , opts)
    vim.keymap.set('n', 'gi'        , vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gr'        , vim.lsp.buf.references    , opts)
    vim.keymap.set('n', '<C-k>'     , vim.diagnostic.goto_prev  , opts)
    vim.keymap.set('n', '<C-j>'     , vim.diagnostic.goto_next  , opts)
    vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename        , opts)
    vim.keymap.set('i', '<C-l>'     , vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>cf', function() vim.lsp.buf.format { async = true } end)
    vim.keymap.set('n', '<leader>ct', vim.cmd.TroubleToggle)

    vim.keymap.set('n', '<space>d'  , vim.diagnostic.open_float , opts)
end

nvim_lsp.hls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        haskell = {
            cabalFormattingProvider = "cabalfmt",
            hlintOn = true,
            formattingProvider = "stylish-haskell"
        }
    }
})

nvim_lsp.lua_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

nvim_lsp.rust_analyzer.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        ["rust-analyzer"] = {
            diagnostics = {
                enable = true,
            },
            checkOnSave = {
                command = "clippy",
            },
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
                enable = true
            },
        }
    }
})

-- Nix
nvim_lsp.nil_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        ['nil'] = {
            formatting = {
                command = { "nixpkgs-fmt" },
            },
        },
    },
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    signs = true,
    update_in_insert = true,
  }
)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, {
        border = "single",
    }
)
