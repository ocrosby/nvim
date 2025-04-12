local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

-- Detect virtualenv name (for Python)
local function python_venv()
  local venv = os.getenv("VIRTUAL_ENV")
  if venv then
    return string.format("🐍 (%s)", vim.fn.fnamemodify(venv, ":t"))
  end
  return ""
end

lualine.setup({
  options = {
    theme = "auto",           -- Use your colorscheme's theme
    globalstatus = true,      -- Single statusline across all windows (Neovim 0.7+)
    section_separators = "",  -- You can use '' and '' for powerline style
    component_separators = "",
    icons_enabled = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { "filename" },
    lualine_x = {
      python_venv,
      "encoding",
      "fileformat",
      "filetype",
    },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
})