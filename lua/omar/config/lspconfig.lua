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
        local venv = os.getenv("VIRTUAL_ENV")
        local python_path = venv and (venv .. "/bin/python") or vim.fn.exepath("python3") or "python3"

        lspconfig.pyright.setup({
            settings = {
                python = {
                    pythonPath = python_path,
                    analysis = {
                        typeCheckingMode = "basic",
                        autoSearchPaths = true,
                        useLibraryCodeForTypes = true,
                        diagnosticMode = "workspace",
                    },
                },
            },
            capabilities = capabilities,
            on_attach = on_attach,
        })
    end,
})
