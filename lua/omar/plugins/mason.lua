-- lua/omar/plugins/mason.lua

local mason_settings = require("omar.config.mason") -- 👈 Loaded once, shared everywhere

return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup(mason_settings.mason)
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup(mason_settings.mason_lspconfig)
        end,
    },
    {
        "jay-babu/mason-null-ls.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim",
        },
        config = function()
            require("mason-null-ls").setup(mason_settings.mason_null_ls)
        end,
    },
}