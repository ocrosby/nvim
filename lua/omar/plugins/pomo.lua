-- lua/omar/plugins/pomo.lua
return {
    "author/pomo.nvim",
    config = function()
        require("omar.config.pomo").setup()
    end,
}
