-- Set space as leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize windows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", ":nohlsearch<CR>", opts)

-- Save file
keymap("n", "<leader>w", ":w<CR>", opts)

-- Quit file
keymap("n", "<leader>q", ":q<CR>", opts)

-- Toggle file explorer
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope finders
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffer" })
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Find help" })
keymap("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", { desc = "Recent Files" })

keymap("n", "<leader>pr", function()
  vim.cmd("edit requirements.txt")
end, { desc = "Open requirements.txt" })

keymap("n", "<leader>pp", function()
  vim.cmd("edit pyproject.toml")
end, { desc = "Open pyproject.toml" })

-- Python-specific enhancements (if using black, ruff, etc.)
keymap("n", "<leader>f", ":lua vim.lsp.buf.format()<CR>", { desc = "Format with LSP" })

-- Diagnostic keymaps
keymap("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
keymap("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
keymap("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Show diagnostic popup" })
keymap("n", "<leader>lq", vim.diagnostic.setloclist, { desc = "Diagnostics to loclist" })

-- LSP keymaps (used in on_attach if modular)
-- Add these to your LSP setup:
-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
-- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
-- etc.