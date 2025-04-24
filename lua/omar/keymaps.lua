-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Common options
local opts = { noremap = true, silent = true }

-- Helper function for toggling options
local function toggle_option(option, scope)
  scope = scope or vim.o
  scope[option] = not scope[option]
  print(option .. " is now " .. (scope[option] and "enabled" or "disabled"))
end

-- Keymaps grouped by category
local keymaps = {
  -- Buffer Navigation
  { mode = "n", lhs = "<leader>n", rhs = ":bn<CR>", desc = "Next buffer" },
  { mode = "n", lhs = "<leader>p", rhs = ":bp<CR>", desc = "Previous buffer" },
  { mode = "n", lhs = "<leader>x", rhs = ":bd<CR>", desc = "Close buffer" },
  { mode = "n", lhs = "<Tab>", rhs = ":bn<CR>", desc = "Next buffer" },
  { mode = "n", lhs = "<S-Tab>", rhs = ":bp<CR>", desc = "Previous buffer" },

  -- Move Lines in Visual Mode
  { mode = "v", lhs = "J", rhs = ":m '>+1<CR>gv=gv", desc = "Move selected lines down" },
  { mode = "v", lhs = "K", rhs = ":m '<-2<CR>gv=gv", desc = "Move selected lines up" },

  -- Save and Quit
  { mode = "n", lhs = "<leader>w", rhs = ":w<CR>", desc = "Save file" },
  { mode = "n", lhs = "<leader>q", rhs = ":q<CR>", desc = "Quit window" },

  -- Window Navigation
  { mode = "n", lhs = "<leader>h", rhs = "<C-w>h", desc = "Move to left window" },
  { mode = "n", lhs = "<leader>j", rhs = "<C-w>j", desc = "Move to bottom window" },
  { mode = "n", lhs = "<leader>k", rhs = "<C-w>k", desc = "Move to top window" },
  { mode = "n", lhs = "<leader>l", rhs = "<C-w>l", desc = "Move to right window" },

  -- Toggle Options
  { mode = "n", lhs = "<leader>ln", rhs = function() toggle_option("relativenumber", vim.wo) end, desc = "Toggle relative line numbers" },
  { mode = "n", lhs = "<leader>sp", rhs = function() toggle_option("spell", vim.wo) end, desc = "Toggle spell check" },
  { mode = "n", lhs = "<leader>sc", rhs = function()
    vim.o.ignorecase = not vim.o.ignorecase
    vim.o.smartcase = not vim.o.smartcase
    print("Search case sensitivity toggled")
  end, desc = "Toggle search case sensitivity" },

  -- Quickfix List Navigation
  { mode = "n", lhs = "<leader>cn", rhs = ":cnext<CR>", desc = "Next quickfix item" },
  { mode = "n", lhs = "<leader>cp", rhs = ":cprev<CR>", desc = "Previous quickfix item" },

  -- Window Resizing
  { mode = "n", lhs = "<C-Up>", rhs = ":resize +2<CR>", desc = "Increase window height" },
  { mode = "n", lhs = "<C-Down>", rhs = ":resize -2<CR>", desc = "Decrease window height" },
  { mode = "n", lhs = "<C-Left>", rhs = ":vertical resize -2<CR>", desc = "Decrease window width" },
  { mode = "n", lhs = "<C-Right>", rhs = ":vertical resize +2<CR>", desc = "Increase window width" },
}

-- Apply keymaps
for _, map in ipairs(keymaps) do
  vim.keymap.set(map.mode, map.lhs, map.rhs, vim.tbl_extend("force", opts, { desc = map.desc }))
end
