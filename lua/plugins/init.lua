-- lua/plugins/init.lua
return {
    -- Example plugins
    { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
    { "neovim/nvim-lspconfig" }, -- LSP configurations

    -- Import the treesitter module
    { import = "plugins.modules.treesitter" },

    -- Import the neovimtree module
    { import = "plugins.modules.nvimtree" },

    -- Add Catppuccin colorscheme
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false, -- Load immediately
        priority = 1000 -- Ensure it loads before other plugins
    },
}