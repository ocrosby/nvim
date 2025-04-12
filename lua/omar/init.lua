-- Core settings
require("omar.core.options")
require("omar.core.keymaps")
-- require("omar.core.autocmds") -- Uncomment if you add this file

-- Plugin manager + plugin declarations
require("omar.plugins.init")

-- Plugin-specific configurations
require("omar.config.lsp")
require("omar.config.cmp")
require("omar.config.treesitter")
require("omar.config.null-ls")
require("omar.config.telescope")
require("omar.config.nvimtree")
require("omar.config.lualine")
-- Add more config as needed (e.g., `require("omar.config.python")`)