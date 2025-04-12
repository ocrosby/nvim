local opt = vim.opt

-- Python-specific formatting
opt.tabstop = 4                     -- PEP8: 4 spaces per tab
opt.shiftwidth = 4                 -- Use 4 spaces for indenting
opt.softtabstop = 4
opt.expandtab = true               -- Convert tabs to spaces
opt.smartindent = true             -- Automatically indent new lines
opt.autoindent = true

-- Files and encoding
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- Line numbers
opt.number = true
opt.relativenumber = true
opt.cursorline = true

-- UI & Navigation
opt.signcolumn = "yes"             -- Always show sign column (for diagnostics)
opt.scrolloff = 8                  -- Keep context when scrolling
opt.sidescrolloff = 8
opt.wrap = false                   -- No line wrapping (Python code prefers full view)

-- Searching
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Splits and layout
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.pumheight = 10                 -- Popup menu height for completions

-- Autocomplete behavior
opt.completeopt = { "menu", "menuone", "noselect" }

-- Undo / backup / swap
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = vim.fn.stdpath("data") .. "/undo//"

-- Python virtualenv behavior (via venv-selector)
vim.g.python3_host_prog = vim.fn.expand("~/.virtualenvs/nvim/bin/python")

-- System clipboard integration
opt.clipboard = "unnamedplus"