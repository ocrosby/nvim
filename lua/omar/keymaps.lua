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

vim.keymap.set('n', "<leader>gb", "<cmd>Telescope git_branches<CR>", { desc = "Git branches" })
vim.keymap.set('n', '<leader>ps', "<cmd>Telescope grep_string<CR>", { desc = "Grep for string" })


-- Neogit Keymaps
vim.keymap.set("n", "<leader>g", "<cmd>Neogit<CR>", { desc = "Open Neogit" })
vim.keymap.set("n", "<leader>gc", "<cmd>Neogit commit<CR>", { desc = "Commit with Neogit" })
vim.keymap.set("n", "<leader>gp", "<cmd>Neogit push<CR>", { desc = "Push with Neogit" })
vim.keymap.set("n", "<leader>gl", "<cmd>Neogit pull<CR>", { desc = "Pull with Neogit" })

-- Trouble.nvim Keymaps
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { desc = "Toggle Trouble" })
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { desc = "Workspace diagnostics" })
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { desc = "Document diagnostics" })
vim.keymap.set("n", "<leader>xr", "<cmd>TroubleToggle lsp_references<cr>", { desc = "LSP references" })
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { desc = "Location list" })
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { desc = "Quickfix list" })

-- Codesnap Keymaps
vim.keymap.set("v", "<leader>cs", ":CodeSnap<CR>", { desc = "Take CodeSnap Screenshot" })

-- Copilot Keymaps
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true, desc = "Accept Copilot suggestion" })
vim.api.nvim_set_keymap("i", "<C-K>", 'copilot#Dismiss()', { silent = true, expr = true, desc = "Dismiss Copilot suggestion" })
vim.api.nvim_set_keymap("i", "<C-Space>", 'copilot#Complete()', { silent = true, expr = true, desc = "Trigger Copilot completion" })
vim.keymap.set("n", "<leader>cp", ":Copilot toggle<CR>", { desc = "Toggle Copilot" })


-- Dap Keymaps
vim.keymap.set("n", "<F5>", function() require("dap").continue() end, { desc = "Start/Continue Debugging" })
vim.keymap.set("n", "<F10>", function() require("dap").step_over() end, { desc = "Step Over" })
vim.keymap.set("n", "<F11>", function() require("dap").step_into() end, { desc = "Step Into" })
vim.keymap.set("n", "<F12>", function() require("dap").step_out() end, { desc = "Step Out" })
vim.keymap.set("n", "<leader>db", function() require("dap").toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dr", function() require("dap").repl.open() end, { desc = "Open REPL" })

-- Harpoon Keymaps
-- Harpoon Keymaps
local ok_mark, mark = pcall(require, "harpoon.mark")
local ok_ui, ui = pcall(require, "harpoon.ui")

if ok_mark and ok_ui then
  vim.keymap.set("n", "<leader>ha", mark.add_file, { desc = "Add file to Harpoon" })
  vim.keymap.set("n", "<leader>h1", function() ui.nav_file(1) end, { desc = "Navigate to Harpoon file 1" })
  vim.keymap.set("n", "<leader>h2", function() ui.nav_file(2) end, { desc = "Navigate to Harpoon file 2" })
  vim.keymap.set("n", "<leader>h3", function() ui.nav_file(3) end, { desc = "Navigate to Harpoon file 3" })
  vim.keymap.set("n", "<leader>h4", function() ui.nav_file(4) end, { desc = "Navigate to Harpoon file 4" })
end
