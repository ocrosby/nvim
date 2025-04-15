return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false, -- Load immediately
    priority = 1000, -- Ensure it loads before other plugins
    config = function()
        require("config.catppuccin") -- Load the configuration from `lua/config/catppuccin.lua`
    end,
}