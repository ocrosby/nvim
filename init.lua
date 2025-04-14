
-- Set indentation options
vim.opt.expandtab = true    -- Use spaces instead of tabs
vim.opt.tabstop = 4         -- Number of spaces a tab counts for
vim.opt.softtabstop = 4     -- Number of spaces for a <Tab> in insert mode
vim.opt.shiftwidth = 4      -- Number of spaces for auto indent

-- Set leader key
vim.g.mapleader = " "       -- Set leader key to space
vim.g.maplocalleader = "\\"

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

require("config.lazy")
require("keymaps")

-- Set the colorscheme
--vim.cmd.colorscheme("catppuccin")
