local null_ls_status, null_ls = pcall(require, "null-ls")
if not null_ls_status then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
-- local code_actions = null_ls.builtins.code_actions -- if you want rufffix or autoflake later

null_ls.setup({
  sources = {
    -- Python formatters
    formatting.black.with({ extra_args = { "--fast" } }),

    -- Python linters
    diagnostics.ruff.with({
      extra_args = { "--max-line-length=88" },
    }),

    -- You can add more tools here for other filetypes as needed
    -- formatting.prettier.with({ filetypes = { "json", "yaml", "markdown" } }),
  },

  -- Automatically format on save
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr, async = false })
        end,
      })
    end
  end,
})