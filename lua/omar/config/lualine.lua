local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

-- Get Python virtualenv name (shown in lualine_x)
local function python_venv()
  local venv = os.getenv("VIRTUAL_ENV")
  if venv then
    return "🐍 " .. vim.fn.fnamemodify(venv, ":t")
  end
  return ""
end

lualine.setup({
  options = {
    theme = "catppuccin",          -- Uses catppuccin's native lualine theme
    icons_enabled = true,
    component_separators = { left = "", right = "" },
    section_separators   = { left = "", right = "" },
    globalstatus = true,
    disabled_filetypes = { statusline = {}, winbar = {} },
  },

  sections = {
    lualine_a = { "mode" },
    lualine_b = { { "branch" }, { "diff" }, { "diagnostics" } },
    lualine_c = { { "filename", path = 1 } }, -- 0 = just file, 1 = relative, 2 = absolute

    lualine_x = {
      python_venv,
      "encoding",
      "fileformat",
      "filetype",
    },

    lualine_y = { "progress" },
    lualine_z = { "location" },
  },

  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
})