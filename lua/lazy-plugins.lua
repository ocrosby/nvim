-- [[ Configure and install plugins ]]
--
-- lazy.nvim auto-discovers every spec under `lua/plugins/*.lua`. To add a
-- plugin, drop a file there returning a `LazySpec`. To remove one, delete
-- its file.
--
--  :Lazy             — current plugin status (press `?` for help, `:q` to close)
--  :Lazy sync        — install, update, and clean

require('lazy').setup({
  { import = 'plugins' },
}, { ---@diagnostic disable-line: missing-fields
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et
