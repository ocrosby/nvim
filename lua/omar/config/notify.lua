-- lua/omar/config/notify.lua

-- Helper function to dynamically pick background based on light/dark theme
local function get_notify_background()
    if vim.o.background == "light" then
        return "#EFF1F5" -- Latte (light theme background)
    else
        return "#1E1E2E" -- Mocha (dark theme background)
    end
end

-- Now build the config using the dynamic background
return {
    background_colour = get_notify_background(), -- Background color for transparency
    stages = "fade", -- Animation style for notifications
    timeout = 3000, -- Notification timeout in milliseconds
    render = "default", -- Default render style
    max_width = 50, -- Maximum width of notifications
    max_height = 10, -- Maximum height of notifications
    fps = 30, -- Frames per second for animations
}