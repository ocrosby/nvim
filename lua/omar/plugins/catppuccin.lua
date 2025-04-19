return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true, -- Load only when needed
    priority = 1000, -- Ensure it loads before other plugins
    config = function()
        require("omar.config.catppuccin") -- Load the configuration from `lua/config/catppuccin.lua`
    end,
}