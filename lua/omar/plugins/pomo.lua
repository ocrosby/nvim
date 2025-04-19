-- lua/omar/plugins/pomo.lua
return {
    "epwalsh/pomo.nvim",
    version = "*",
    lazy = true,
    cmd = { "TimerStart", "TimerRepeat", "TimerStop" },
    dependencies = {
        -- Optional, but highly recommended if you want to use the "Default" timer
        "rcarriga/nvim-notify", -- Notification system
    },
    config = function()
        local pomo_config = require("omar.config.pomo")
        require("pomo").setup(pomo_config)
    end,
}
