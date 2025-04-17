local function lsp_clients()
  local clients = vim.lsp.get_active_clients({ bufnr = 0 })
  if #clients == 0 then return "" end
  local names = {}
  for _, client in pairs(clients) do
    table.insert(names, client.name)
  end
  return " " .. table.concat(names, ", ")
end

local function python_venv()
  if vim.bo.filetype ~= "python" then return "" end
  local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_DEFAULT_ENV")
  return venv and (" " .. vim.fn.fnamemodify(venv, ":t")) or ""
end

require("lualine").setup({
  options = {
    theme = "auto",
    globalstatus = true,
    icons_enabled = true,
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
    disabled_filetypes = { statusline = { "dashboard", "NvimTree" }, winbar = {} },
  },
  sections = {
    lualine_a = { { "mode", icon = "" } },
    lualine_b = { { "branch", icon = "" }, "diff" },
    lualine_c = {
      {
        "filename",
        path = 1,
        symbols = {
          modified = " ●",
          readonly = " 🔒",
          unnamed = "[No Name]",
        },
      },
    },
    lualine_x = {
      python_venv,
      lsp_clients,
      {
        "diagnostics",
        sources = { "nvim_lsp" },
        symbols = { error = " ", warn = " ", info = " ", hint = " " },
      },
      "encoding",
      "fileformat",
      "filetype",
    },
    lualine_y = { "progress" },
    lualine_z = { { "location", icon = "" } },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      {
        "filename",
        path = 1,
      },
    },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {
    lualine_a = {
      {
        "tabs",
        mode = 2,
        max_length = vim.o.columns / 3,
        tabs_color = {
          active = "lualine_a_normal",
          inactive = "lualine_b_inactive",
        },
        symbols = { modified = " ●" },
      },
    },
    lualine_z = { "hostname" },
  },
  extensions = { "nvim-tree", "fugitive", "quickfix" },
})

