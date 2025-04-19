return {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvimtools/none-ls-extras.nvim", -- Add extras here as a dependency
    },
    config = function() 
        require("omar.config.none-ls")
    end,
}

