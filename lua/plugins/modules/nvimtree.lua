return {
    "nvim-tree/nvim-tree.lua",
    config = function()
        require("nvim-tree").setup({
            disable_netrw = true, -- Disable netrw
            hijack_netrw = true, -- Hijack netrw window
            renderer = {
                highlight_git = true, -- Highlight git changes
                icons = {
                    show = {
                        git = true,
                        folder = true,
                        file = true,
                        folder_arrow = true,
                    },
                },
            },
            diagnostics = {
                enable = true, -- Enable diagnostics
                show_on_dirs = true,
            },
            view = {
                width = 30, -- Set tree width
                side = "left", -- Open tree on the left
            },
        })
    end,
    dependencies = {
        "nvim-tree/nvim-web-devicons", -- Optional, for file icons
    },
}