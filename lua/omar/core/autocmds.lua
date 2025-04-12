-- Create a group for all omar-specific autocommands
local augroup = vim.api.nvim_create_augroup
local omar_group = augroup("omar_autocmds", { clear = true })

local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
autocmd("TextYankPost", {
  group = omar_group,
  desc = "Highlight when yanking text",
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 150 })
  end,
})

-- Trim trailing whitespace on save (Python-friendly)
autocmd("BufWritePre", {
  group = omar_group,
  desc = "Trim trailing whitespace on save",
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

-- Set Python-specific indentation rules
autocmd("FileType", {
  group = omar_group,
  pattern = "python",
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.shiftwidth = 4
    vim.bo.softtabstop = 4
    vim.bo.expandtab = true
  end,
})

-- Enable spell checking in Markdown and Git commit messages
autocmd("FileType", {
  group = omar_group,
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.wrap = true
  end,
})

-- Auto-reload .nvim config on save
autocmd("BufWritePost", {
  group = omar_group,
  pattern = { "init.lua", "*/lua/omar/**/*.lua" },
  callback = function()
    vim.cmd("source $MYVIMRC")
    print("🔁 Reloaded Neovim config!")
  end,
})