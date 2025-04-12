local status_ok, telescope = pcall(require, "telescope")
local builtin = require("telescope.builtin")

if not status_ok then
  return
end

local actions = require("telescope.actions")

-- Custom function to search Python project files
local function python_project_files()
  builtin.find_files({
    prompt_title = "Python Project Files",
    find_command = {
      "rg", "--files", "--hidden",
      "-g", "requirements.txt",
      "-g", "pyproject.toml",
      "-g", "Pipfile",
      "-g", "setup.py",
      "-g", "tox.ini",
      "-g", ".env",
    },
  })
end

-- Expose the function globally (optional)
vim.api.nvim_create_user_command("PythonFiles", python_project_files, {})

-- Optional keymap
vim.keymap.set("n", "<leader>pf", python_project_files, { desc = "Python Config Files" })


telescope.setup({
  defaults = {
    prompt_prefix = "🔍 ",
    selection_caret = " ",
    path_display = { "smart" },
    layout_config = {
      horizontal = { width = 0.9 },
    },
    file_ignore_patterns = { "__pycache__/", "%.venv/", "%.git/", "%.mypy_cache/" },
    mappings = {
      i = {
        ["<esc>"] = actions.close,
      },
    },
  },

  pickers = {
    find_files = {
      hidden = true,         -- Include dotfiles
      follow = true,         -- Follow symlinks
    },
    live_grep = {
      additional_args = function()
        return { "--hidden" }
      end,
    },
  },
})

-- Try loading the fzf extension if available
pcall(telescope.load_extension, "fzf")