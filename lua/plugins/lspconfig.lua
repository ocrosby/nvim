return {
    "neovim/nvim-lspconfig",
    dependencies = {
        {
            "williamboman/mason.nvim", -- Plugin to manage LSP installations
            config = true, -- Automatically run Mason's setup
        },
        {
            "williamboman/mason-lspconfig.nvim", -- Bridge between Mason and lspconfig
            config = function()
                require("config.mason") -- Load the configuration from `lua/config/mason.lua`
            end,
        },
    },
    config = function()
        require("config.lspconfig") -- Load the configuration from `lua/config/lspconfig.lua`
    end,
}