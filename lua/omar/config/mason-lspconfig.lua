-- lua/omar/config/mason-lspconfig.lua
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
  ensure_installed = {
    "lua_ls",   -- Lua
    "tsserver", -- JavaScript/TypeScript (correct name!)
    "pyright",  -- Python
    "bashls",   -- Bash
    "clangd",   -- C/C++
  },
})
