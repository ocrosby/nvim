-- Set leader key
vim.g.mapleader = " "       -- Set leader key to space
vim.g.maplocalleader = "\\" -- Set local leader key to backslash

-- NvimTree Keymaps
vim.keymap.set('n', '<leader>e', function()
  local view = require("nvim-tree.view")

  if not view.is_visible() then
    -- If NvimTree isn't visible, open it
    vim.cmd("NvimTreeOpen")
    return
  end

  local tree_win = view.get_winnr()
  local curr_win = vim.api.nvim_get_current_win()

  if curr_win == tree_win then
    -- You're in the tree → go to the right (your editor)
    vim.cmd("wincmd l")
  else
    -- You're in the editor → focus the tree
    vim.cmd("NvimTreeFocus")
  end
end, { desc = "Toggle focus between NvimTree and editor" })

-- pressing <leader>nf while in the tree will create a new file wherever you are
vim.keymap.set("n", "<leader>nf", function()
  local api = require("nvim-tree.api")
  local node = api.tree.get_node_under_cursor()
  local path = node and (node.type == "directory" and node.absolute_path or vim.fn.fnamemodify(node.absolute_path, ":h")) or vim.fn.getcwd()

  vim.ui.input({ prompt = "New file name: ", default = path .. "/" }, function(input)
    if input and input ~= "" then
      vim.cmd("e " .. input)
    end
  end)
end, { desc = "Create new file from NvimTree location" })

-- Move Lines in Visual Mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

-- Plenary Test File
-- runs tests for the current file using Plenary.nvim's test harness.
vim.api.nvim_set_keymap("n", "<leader>tf", "<Plug>PlenaryTestFile", { noremap = false, silent = false, desc = "Run tests in file" })

-- Smarter Join & Scroll
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" }) -- Join lines and keep cursor position
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" }) -- Scroll down and center
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" }) -- Scroll up and center

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

-- Yank the contents of the buffer to the clipboard
vim.keymap.set("n", "<leader>y", ":%y+<CR>", { noremap = true, silent = true })

-- Vim-With-Me (Pair Programming)
-- Start/stop a collaborative editing session.
vim.keymap.set("n", "<leader>vwm", function() require("vim-with-me").StartVimWithMe() end)
vim.keymap.set("n", "<leader>svwm", function() require("vim-with-me").StopVimWithMe() end)


-- Tree-sitter Incremental Selection
vim.keymap.set("n", "gnn", ":lua require'nvim-treesitter.incremental_selection'.init_selection()<CR>", { desc = "Init selection" })
vim.keymap.set("n", "grc", ":lua require'nvim-treesitter.incremental_selection'.scope_incremental()<CR>", { desc = "Scope incremental" })
vim.keymap.set("n", "grm", ":lua require'nvim-treesitter.incremental_selection'.node_decremental()<CR>", { desc = "Node decremental" })

vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

