local status_ok, nvimtree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

-- Recommended settings for disabling netrw and setting up truecolor
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

-- Setup nvim-tree
nvimtree.setup({
  sort_by = "case_sensitive",

  view = {
    width = 35,
    side = "left",
    preserve_window_proportions = true,
  },

  renderer = {
    group_empty = true,
    highlight_git = true,
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
    },
  },

  filters = {
    dotfiles = false,
    custom = { "__pycache__", ".venv", ".git" },
  },

  diagnostics = {
    enable = true,
    show_on_dirs = true,
    show_on_open_dirs = true,
    icons = {
      hint = "󰌵",
      info = "",
      warning = "",
      error = "",
    },
  },

  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },

  update_focused_file = {
    enable = true,
    update_root = false,
  },

  actions = {
    open_file = {
      resize_window = true,
    },
  },
})