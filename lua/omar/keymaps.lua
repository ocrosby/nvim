-- Set leader key
vim.g.mapleader = " "       -- Set leader key to space
vim.g.maplocalleader = "\\" -- Set local leader key to backslash

-- Buffer Navigation 
vim.keymap.set("n", "<leader>n", ":bn<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>p", ":bp<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>x", ":bd<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<Tab>", ":bn<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", ":bp<CR>", { desc = "Previous buffer" })

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

-- Buffer Management Keymaps
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete current buffer" })
vim.keymap.set("n", "<leader>ba", ":%bd|e#|bd#<CR>", { desc = "Close all buffers except current" })

-- Window Resizing Keymaps
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Quick Save Keymap
vim.keymap.set("n", "<leader>s", ":w<CR>", { desc = "Save file" })

-- Toggle Relative Line Numbers Keymaps
vim.keymap.set("n", "<leader>ln", function()
  vim.wo.relativenumber = not vim.wo.relativenumber
end, { desc = "Toggle relative line numbers" })

-- Search Enhancement Keymaps
vim.keymap.set("n", "<leader>nh", ":nohlsearch<CR>", { desc = "Clear search highlights" })
vim.keymap.set("n", "<leader>sc", function()
  vim.o.ignorecase = not vim.o.ignorecase
  vim.o.smartcase = not vim.o.smartcase
  print("Search case sensitivity toggled")
end, { desc = "Toggle search case sensitivity" })

-- Toggle Spell Check Keymaps
vim.keymap.set("n", "<leader>sp", function()
  vim.wo.spell = not vim.wo.spell
end, { desc = "Toggle spell check" })

-- Quickfix List Navigation Keymaps
vim.keymap.set("n", "<leader>cn", ":cnext<CR>", { desc = "Next quickfix item" })
vim.keymap.set("n", "<leader>cp", ":cprev<CR>", { desc = "Previous quickfix item" })

-- Session Management Keymaps
vim.keymap.set("n", "<leader>ss", ":mksession!<CR>", { desc = "Save session" })
vim.keymap.set("n", "<leader>sl", ":source Session.vim<CR>", { desc = "Load session" })

-- Cycle Splits: Next
vim.keymap.set("n", "<leader>wn", function()
  -- Repeat cycling by count
  local count = vim.v.count1 -- if user types '5<leader>wn', will cycle 5 times
  for _ = 1, count do
    vim.cmd("wincmd w")
  end
end, { noremap = true, silent = true, desc = "Move to next split" })

-- Cycle Splits: Previous
vim.keymap.set("n", "<leader>wp", function()
  local count = vim.v.count1
  for _ = 1, count do
    vim.cmd("wincmd W")
  end
end, { noremap = true, silent = true, desc = "Move to previous split" })

-- Optional: Create splits easily
vim.keymap.set("n", "<leader>ws", ":split<CR>", { noremap = true, silent = true, desc = "Horizontal split" })
vim.keymap.set("n", "<leader>wv", ":vsplit<CR>", { noremap = true, silent = true, desc = "Vertical split" })
