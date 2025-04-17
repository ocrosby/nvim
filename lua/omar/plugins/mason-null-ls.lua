return {
  "jay-babu/mason-null-ls.nvim",
  dependencies = { "williamboman/mason.nvim", "nvimtools/none-ls.nvim" },
  config = function()
    require("mason-null-ls").setup({
      ensure_installed = {
        "ruff",
        "black",
        "prettier",
        "shellcheck",
      },
      automatic_installation = true,
      automatic_setup = true,
    })

    -- Then set up sources normally in none-ls.lua
    require("omar.config.none-ls")
  end,
}
