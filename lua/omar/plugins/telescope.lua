return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" }, -- Required dependency
    config = function()
        require("omar.config.telescope") -- Load the configuration from `lua/config/telescope.lua`
    end,
}