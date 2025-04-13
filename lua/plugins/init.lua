-- lua/plugins/init.lua
return {
    -- Example plugins
    { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
    { "neovim/nvim-lspconfig" }, -- LSP configurations

    -- Import the treesitter module
    { import = "plugins.modules.treesitter" },

    -- Import the neotree module
    { import = "plugins.modules.neotree" },

    -- Add Catppuccin colorscheme
    { "catppuccin/nvim", lazy = false, name = "catppuccin", priority = 1000 },

    -- Add neo-tree
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
        lazy = false, -- neo-tree will lazily load itself
        ---@module "neo-tree"
        ---@type neotree.Config?
        opts = {
            -- fill any relevant options here
            window = {
                position = "left",
                width = 30,
            },
            filesystem = {
                filtered_items = {
                    hide_dotfiles = false,
                    hide_gitignored = false,
                },
            },
        },
    }
}