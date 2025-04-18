-- lua/config/lspconfig.lua
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Example configuration for language servers
lspconfig.pyright.setup({
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "basic",
            },
        },
    },
    capabilities = capabilities, -- Enable nvim-cmp capabilities
    on_attach = function(client, bufnr)
        -- Add any additional on_attach logic here
    end,
}) -- Python
lspconfig.ts_ls.setup({}) -- TypeScript/JavaScript
lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim", "obsidian" },
            },
        },
    },
})