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

        vim.cmd([[
          highlight PomoStatus guifg=#cdd6f4 guibg=NONE
          highlight PomoSubtext guifg=#cdd6f4 guibg=NONE
          highlight PomoIcon guifg=#cdd6f4 guibg=NONE
        ]])

        -- Pomo.nvim Keymaps
        vim.keymap.set("n", "<leader>ps", ":TimerStart 25m Work<CR>", { desc = "Start Pomodoro Work timer" })
        vim.keymap.set("n", "<leader>pb", ":TimerStart 5m Break<CR>", { desc = "Start Pomodoro Break timer" })
        vim.keymap.set("n", "<leader>pl", ":TimerStart 15m Long Break<CR>", { desc = "Start Pomodoro Long Break timer" })
        vim.keymap.set("n", "<leader>pr", ":TimerRepeat<CR>", { desc = "Repeat last timer" })
        vim.keymap.set("n", "<leader>pe", ":TimerStop<CR>", { desc = "Stop current timer" })
        vim.keymap.set("n", "<leader>pp", ":TimerStart pomodoro<CR>", { desc = "Start Pomodoro session" })
    end,
}

