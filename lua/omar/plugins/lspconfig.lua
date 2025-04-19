return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" }, -- Lazy load lspconfig
    dependencies = {
        "williamboman/mason.nvim", -- just listed as a dependency
        "williamboman/mason-lspconfig.nvim", -- just listed as a dependency
    },
    config = function()
        require("omar.config.lspconfig") -- Load the configuration from `lua/config/lspconfig.lua`
    end,
}
