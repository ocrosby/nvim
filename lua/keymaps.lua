-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Save and Quit
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit window" })

-- Buffer Navigation
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous buffer" })

-- Window Navigation
vim.keymap.set("n", "<leader>h", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<leader>j", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<leader>k", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<leader>l", "<C-w>l", { desc = "Move to right window" })

-- Telescope Keymaps
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Search text in files" })

-- Neotree Keymaps
vim.keymap.set('n', '<leader>n', ':Neotree toggle<CR>', { desc = "Toggle Neotree" })

-- Tree-sitter Incremental Selection
vim.keymap.set("n", "gnn", ":lua require'nvim-treesitter.incremental_selection'.init_selection()<CR>", { desc = "Init selection" })
vim.keymap.set("n", "grc", ":lua require'nvim-treesitter.incremental_selection'.scope_incremental()<CR>", { desc = "Scope incremental" })
vim.keymap.set("n", "grm", ":lua require'nvim-treesitter.incremental_selection'.node_decremental()<CR>", { desc = "Node decremental" })