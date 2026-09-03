require("keymaps")
require("cmd")
require("set")
require("lsp.servers")
require("lsp.diagnostics")
if vim.version().minor >= 0.13 then
    require("multicursor")
end
