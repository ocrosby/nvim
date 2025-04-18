-- lua/omar/config/zenmode.lua
local M = {}

function M.setup()
    require("zen-mode").setup({
        window = {
            backdrop = 0.95,
            width = 80,
            height = 0.9,
            options = {
                signcolumn = "no",
                number = false,
                relativenumber = false,
                cursorline = false,
                cursorcolumn = false,
                foldcolumn = "0",
            },
        },
        plugins = {
            gitsigns = { enabled = false },
            tmux = { enabled = false },
            twilight = { enabled = true },
        },
        on_open = function()
            -- Custom logic when Zen mode opens
        end,
        on_close = function()
            -- Custom logic when Zen mode closes
        end,
    })
end

return M