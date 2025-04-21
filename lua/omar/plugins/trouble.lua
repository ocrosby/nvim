return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional but nice
  cmd = { "TroubleToggle", "Trouble", "TroubleClose", "TroubleRefresh" }, -- lazy load on command
  config = function()
    require("omar.config.trouble")
  end,
}
