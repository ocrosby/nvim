-- lua/omar/config/pomo.lua
local M = {}

function M.setup()
    require("pomo").setup({
        work_time = 25, -- Work duration in minutes
        break_time = 5, -- Break duration in minutes
        long_break_time = 15, -- Long break duration in minutes
        cycles = 4, -- Number of cycles before a long break
        notifications = true, -- Enable notifications
        on_work_start = function()
            print("Time to focus!")
        end,
        on_break_start = function()
            print("Take a short break!")
        end,
        on_long_break_start = function()
            print("Enjoy your long break!")
        end,
    })
end

return M