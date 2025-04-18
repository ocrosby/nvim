-- lua/omar/plugins/zenmode.lua
return {
    "folke/zen-mode.nvim",
    config = function()
        require("omar.config.zenmode").setup()
    end,
}
