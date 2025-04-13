
-- Set indentation options
vim.opt.expandtab = true    -- Use spaces instead of tabs
vim.opt.tabstop = 4         -- Number of spaces a tab counts for
vim.opt.softtabstop = 4     -- Number of spaces for a <Tab> in insert mode
vim.opt.shiftwidth = 4      -- Number of spaces for auto indent

vim.g.mapleader = " "        -- Set leader key to space

require("config.lazy")
require("keymaps")

--require("catppuccin").setup()
--
--vim.cmd.colorscheme "catppuccin"

-- Core settings
--require('keymaps')
--require('plugins.lazy')
--require('plugins.misc')
--require('plugins.lualine')
--require('options')
--require('misc')
--require('plugins.dap')
--require('plugins.gitsigns')
--require('plugins.telescope')
--require('plugins.treesitter')
--require('plugins.lsp')
--require('plugins.trouble')
--require('plugins.obsidian')
--require('plugins.zenmode')
--require('plugins.neogit')
--require('plugins.codesnap')
--require('plugins.harpoon')