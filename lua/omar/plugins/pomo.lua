-- lua/omar/plugins/pomo.lua
return {
    "epwalsh/pomo.nvim",
    config = function()
        require("omar.config.pomo").setup()
    end,
}
