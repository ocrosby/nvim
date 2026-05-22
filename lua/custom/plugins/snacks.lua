-- https://github.com/folke/snacks.nvim
--
-- snacks.nvim is a meta-plugin from folke that bundles a number of small,
-- composable QoL modules. Enabled here:
--   - explorer  : file-tree replacement for kickstart's neo-tree spec
--   - picker    : rendering backend required by explorer
--   - notifier  : replaces vim.notify with floating-window notifications

---@module 'lazy'
---@type LazySpec
return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    explorer = { enabled = true },
    picker = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
  },
  keys = {
    {
      '\\',
      function()
        Snacks.explorer()
      end,
      desc = 'Toggle Snacks Explorer',
    },
    {
      '<leader>e',
      function()
        Snacks.explorer()
      end,
      desc = '[E]xplorer (Snacks)',
    },
    {
      '<leader>E',
      function()
        Snacks.explorer.reveal()
      end,
      desc = '[E]xplorer reveal current file',
    },
    {
      '<leader>nd',
      function()
        Snacks.notifier.hide()
      end,
      desc = '[N]otifier [D]ismiss',
    },
    {
      '<leader>nh',
      function()
        Snacks.notifier.show_history()
      end,
      desc = '[N]otifier [H]istory',
    },
  },
}
