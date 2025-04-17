return {
  "folke/trouble.nvim",
  cmd = "TroubleToggle", -- lazy load when you first open it
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("omar.config.trouble")
  end,
}
