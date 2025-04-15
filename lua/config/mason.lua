-- lua/config/mason.lua
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

-- Setup mason
mason.setup()

-- Setup mason-lspconfig
mason_lspconfig.setup({
    ensure_installed = {
        "lua_ls", -- Lua
        "ts_ls", -- TypeScript/JavaScript
        --"gopls", -- Go
        "pyright", -- Python
        "zls", -- Zsh
        "bashls", -- Bash
        "clangd", -- C/C++
    },
})