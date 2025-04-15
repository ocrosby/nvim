-- lua/config/lspconfig.lua
local lspconfig = require("lspconfig")

-- Example configuration for language servers
lspconfig.pyright.setup({}) -- Python
lspconfig.ts_ls.setup({}) -- TypeScript/JavaScript
lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
})