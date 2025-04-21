-- lua/omar/config/lsp/servers/pyright.lua
local util = require("lspconfig.util")

return {
  settings = {
    python = {
      pythonPath = (function()
        local venv = os.getenv("VIRTUAL_ENV")
        if venv then
          return venv .. "/bin/python"
        else
          return vim.fn.exepath("python3") or "python3"
        end
      end)(),
    },
  },
  root_dir = util.root_pattern(".git", "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt"),
}
