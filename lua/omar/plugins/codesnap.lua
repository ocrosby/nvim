return {
  "mistricky/codesnap.nvim",
  build = "make",
  lazy = true,
  cmd = "CodeSnap",
  config = function()
    require("omar.config.codesnap")
  end,
}

