local null_ls = require("null-ls")

-- Define custom Ruff sources manually
local ruff_diagnostics = {
  method = null_ls.methods.DIAGNOSTICS,
  filetypes = { "python" },
  generator = null_ls.generator({
    command = "ruff",
    args = { "check", "--no-cache", "--stdin-filename", "$FILENAME", "-" },
    to_stdin = true,
    from_stderr = false,
    format = "line",
    on_output = function(line)
      local col, msg = line:match("^.-:(%d+):(%d+): (.+)")
      if not col then return nil end

      return {
        row = tonumber(col),
        col = tonumber(msg),
        message = msg,
        severity = 1, -- Error
        source = "ruff",
      }
    end,
  }),
}

local ruff_formatting = {
  method = null_ls.methods.FORMATTING,
  filetypes = { "python" },
  generator = null_ls.formatter({
    command = "ruff",
    args = { "format", "--stdin-filename", "$FILENAME", "-" },
    to_stdin = true,
  }),
}

local diagnostics = {
  ruff_diagnostics
}

local formatting = {
    ruff_formatting,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.prettier,
}

-- Only add shellcheck if it is executable
--if vim.fn.executable("shellcheck") == 1 then
--    table.insert(diagnostics, null_ls.builtins.diagnostics.shellcheck)
--end

null_ls.setup({
  sources = vim.list_extend(diagnostics, formatting),
})
