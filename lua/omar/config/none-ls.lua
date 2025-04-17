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

null_ls.setup({
  sources = {
    ruff_diagnostics,
    ruff_formatting,

    -- other tools if you want
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.diagnostics.shellcheck,
  },
})

