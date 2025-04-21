vim.api.nvim_create_user_command("NvimTreeCheckSync", function()
  local ok, api = pcall(require, "nvim-tree.api")
  if not ok then
    vim.notify("nvim-tree not loaded!", vim.log.levels.WARN)
    return
  end

  local cwd = vim.fn.getcwd()
  vim.notify("Current working directory: " .. cwd, vim.log.levels.INFO)

  local root = api.tree.get_tree_root()
  if root then
    vim.notify("NvimTree root: " .. tostring(root.absolute_path), vim.log.levels.INFO)
  else
    vim.notify("NvimTree root is nil (tree might not be open yet).", vim.log.levels.WARN)
  end

  -- Trigger reload so you can see immediate changes
  api.tree.reload()
  vim.notify("NvimTree reloaded from disk.", vim.log.levels.INFO)
end, { desc = "Check NvimTree root + force reload" })

