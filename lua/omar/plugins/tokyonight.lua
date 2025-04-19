return {
    "folke/tokyonight.nvim",
    lazy = true, -- Load only when needed
    priority = 1000, -- Ensure it loads first
    config = function()
        require("omar.config.tokyonight") -- Load the configuration
    end,
}
