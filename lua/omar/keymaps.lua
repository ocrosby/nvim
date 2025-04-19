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
vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<CR>", { desc = "Open Neogit" })
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

--- Obsidian Keymaps
vim.keymap.set("n", "<leader>oo", ":ObsidianOpen<CR>", { desc = "Open Obsidian note" })
vim.keymap.set("n", "<leader>ot", ":ObsidianToday<CR>", { desc = "Open today's note" })
vim.keymap.set("n", "<leader>on", ":ObsidianNew<CR>", { desc = "Create a new note" })
vim.keymap.set("n", "<leader>os", ":ObsidianSearch<CR>", { desc = "Search notes" })
vim.keymap.set("n", "<leader>ob", ":ObsidianBacklinks<CR>", { desc = "Show backlinks" })
vim.keymap.set("n", "<leader>ol", ":ObsidianLink<CR>", { desc = "Create a link to another note" })
vim.keymap.set("n", "<leader>of", ":ObsidianFollowLink<CR>", { desc = "Follow a link" })

--- Zen Mode Keymaps
vim.keymap.set("n", "<leader>zz", ":ZenMode<CR>", { desc = "Toggle Zen Mode" })
vim.keymap.set("n", "<leader>zq", ":ZenMode<CR>:q<CR>", { desc = "Toggle Zen Mode and quit" })

-- Pomo.nvim Keymaps
vim.keymap.set("n", "<leader>ps", ":TimerStart 25m Work<CR>", { desc = "Start Pomodoro Work timer" })
vim.keymap.set("n", "<leader>pb", ":TimerStart 5m Break<CR>", { desc = "Start Pomodoro Break timer" })
vim.keymap.set("n", "<leader>pl", ":TimerStart 15m Long Break<CR>", { desc = "Start Pomodoro Long Break timer" })
vim.keymap.set("n", "<leader>pr", ":TimerRepeat<CR>", { desc = "Repeat last timer" })
vim.keymap.set("n", "<leader>pe", ":TimerStop<CR>", { desc = "Stop current timer" })
vim.keymap.set("n", "<leader>pp", ":TimerStart pomodoro<CR>", { desc = "Start Pomodoro session" })

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

-- lua/omar/keymaps.lua

-- Keymaps for Neotest
vim.keymap.set("n", "<leader>tt", function()
  require("neotest").run.run()
end, { noremap = true, silent = true, desc = "Run nearest test" })

vim.keymap.set("n", "<leader>tT", function()
  require("neotest").run.run(vim.fn.expand("%"))
end, { noremap = true, silent = true, desc = "Run entire test file" })

vim.keymap.set("n", "<leader>ts", function()
  require("neotest").summary.toggle()
end, { noremap = true, silent = true, desc = "Toggle test summary" })

vim.keymap.set("n", "<leader>to", function()
  require("neotest").output.open({ enter = true })
end, { noremap = true, silent = true, desc = "Show test output" })

vim.keymap.set("n", "<leader>tw", function()
  require("neotest").watch.toggle(vim.fn.expand("%"))
end, { noremap = true, silent = true, desc = "Toggle watch file" })

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
