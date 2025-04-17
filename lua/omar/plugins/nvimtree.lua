return {
    "nvim-tree/nvim-tree.lua",
    config = function()
        require("omar.config.nvimtree")
    end,
    dependencies = {
        "nvim-tree/nvim-web-devicons", -- optional but recommended
    },
}

