-- lua/omar/config/lspconfig.lua

local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Define a common on_attach function
local on_attach = function(client, bufnr)
    -- Add custom keymaps, commands, formatting triggers here if you want
end

-- Setup mason-lspconfig handlers
mason_lspconfig.setup_handlers({
    -- Default handler for every installed server
    function(server_name)
        lspconfig[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })
    end,

    -- Custom setup for specific servers
    ["lua_ls"] = function()
        lspconfig.lua_ls.setup({
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim", "obsidian" },
                    },
                },
            },
            capabilities = capabilities,
            on_attach = on_attach,
        })
    end,

    ["pyright"] = function()
        lspconfig.pyright.setup({
            settings = {
                python = {
                    analysis = {
                        typeCheckingMode = "basic",
                    },
                },
            },
            capabilities = capabilities,
            on_attach = on_attach,
        })
    end,
})
