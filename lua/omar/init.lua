-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("omar.options") -- Load settings
require("omar.keymaps") -- Load keymaps
require("omar.autocmds") -- Load autocmds early
require("omar.config.lazy")  -- Load lazy.nvim
