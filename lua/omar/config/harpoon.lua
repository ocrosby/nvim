local harpoon = require("harpoon")
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

harpoon.setup({
    menu = {
        width = vim.api.nvim_win_get_width(0) - 20,
    },
})