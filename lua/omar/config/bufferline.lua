--  lua/omar/config/bufferline.lua

require("bufferline").setup({
  options = {
    mode = "buffers", -- set to "tabs" to show tabpages instead
    numbers = "ordinal", -- show buffer numbers
    close_command = "bdelete! %d", -- close buffer command
    right_mouse_command = "bdelete! %d", -- right-click to close buffer
    left_mouse_command = "buffer %d", -- left-click to go to buffer
    middle_mouse_command = nil, -- disable middle-click
    indicator = {
      style = "icon",
      icon = "▎", -- default indicator
    },
    buffer_close_icon = "",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    diagnostics = "nvim_lsp", -- show LSP diagnostics in bufferline
    diagnostics_update_in_insert = false,
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    separator_style = "slant", -- "slant" | "thick" | "thin" | {"", ""}
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "center",
        separator = true,
      },
    },
  },
})

