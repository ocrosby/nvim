-- lua/omar/config/mason.lua
return {
    mason = {
        ui = {
            border = "rounded",
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗",
            },
        },
    },

    mason_lspconfig = {
        ensure_installed = {
            "lua_ls",   -- Lua
            "tsp_server", -- JavaScript/TypeScript (ts_ls, tsp_server, or vtsls)
            "pyright",  -- Python
            "bashls",   -- Bash
            "clangd",   -- C/C++
        },
    },

    mason_null_ls = {
        ensure_installed = {
            "stylua",  -- Lua formatter
            "prettier", -- JavaScript/TypeScript formatter
            "black",    -- Python formatter
            "shfmt",    -- Bash formatter
            "clang_format", -- C/C++ formatter
        },
        automatic_installation = true,
        automatic_setup = true,
    },
}
