return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional, for icons
  event = "VeryLazy", -- Lazy load for performance
  config = function()
    require("omar.config.bufferline")
  end,
}
