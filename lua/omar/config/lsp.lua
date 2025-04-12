-- Ensure mason and lspconfig are available
local mason_status, mason = pcall(require, "mason")
local mason_lsp_status, mason_lspconfig = pcall(require, "mason-lspconfig")
local lspconfig_status, lspconfig = pcall(require, "lspconfig")

if not mason_status or not mason_lsp_status or not lspconfig_status then
  return
end

-- Setup mason
mason.setup()

-- Setup mason-lspconfig with recommended servers
mason_lspconfig.setup({
  ensure_installed = { "pyright", "lua_ls" },
})

-- Setup capabilities for nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Common on_attach function (LSP keymaps)
local on_attach = function(_, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  local keymap = vim.keymap.set

  keymap("n", "gd", vim.lsp.buf.definition, bufopts)
  keymap("n", "gD", vim.lsp.buf.declaration, bufopts)
  keymap("n", "gi", vim.lsp.buf.implementation, bufopts)
  keymap("n", "gr", vim.lsp.buf.references, bufopts)
  keymap("n", "K", vim.lsp.buf.hover, bufopts)
  keymap("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
  keymap("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
  keymap("n", "<leader>lf", function() vim.lsp.buf.format({ async = true }) end, bufopts)
end

-- Setup each installed server
mason_lspconfig.setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
  end,
})