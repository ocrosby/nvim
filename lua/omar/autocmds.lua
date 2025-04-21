-- Open nvim-tree by default when starting Neovim
local function open_nvim_tree()
    require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- Reload nvim-tree when entering a buffer
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = "NvimTree_*",
  callback = function()
    local api_ok, api = pcall(require, "nvim-tree.api")
    if api_ok then
      api.tree.reload()
    end
  end,
})
