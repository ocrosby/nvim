require("trouble").setup({
  position = "bottom",         -- or "right", "left", "top"
  height = 10,                 -- height of the Trouble window
  icons = true,                -- use devicons for file icons
  fold_open = "",             -- symbol for open folds
  fold_closed = "",           -- symbol for closed folds
  group = true,                -- group results by file
  padding = true,              -- add an extra new line on top of the list
  action_keys = {              -- key mappings for actions in Trouble buffer
    close = "q",               -- close the list
    cancel = "<esc>",          -- cancel preview
    refresh = "r",             -- manually refresh
    jump = { "<cr>", "<tab>" },-- jump to the diagnostic or open folds
    open_split = { "<c-x>" },  -- open buffer in new split
    open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
  },
  use_diagnostic_signs = true, -- use signs defined in your LSP client
})

