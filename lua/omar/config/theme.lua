-- ~/.config/nvim/lua/omar/config/theme.lua
local catppuccin = require("catppuccin")

catppuccin.setup({
  flavour = "mocha", -- latte, frappe, macchiato, mocha
  transparent_background = false,
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    treesitter = true,
    telescope = true,
    lualine = true,
  },
})

vim.cmd.colorscheme("catppuccin")