
-- Set indentation options
vim.cmd("set expandtab") -- Use spaces instead of tabs
vim.cmd("set tabstop=4")  -- Number of spaces a tab counts for
vim.cmd("set softtabstop=4") -- Number of spaces for a <Tab> in insert mode
vim.cmd("set shiftwidth=4") -- Number of spaces for auto indent

-- Set leader key
vim.g.mapleader = " "       -- Set leader key to space
vim.g.maplocalleader = "\\" -- Set local leader key to backslash

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

require("config.lazy")  -- Load lazy.nvim
require("keymaps")      -- Load keymaps
require("catppuccin")   -- Load Catppuccin colorscheme


