return {
  -- Python virtual environment selector UI
  "linux-cultist/venv-selector.nvim",

  -- Jupyter Notebook support inside Neovim (optional)
  {
    "dccsillag/magma-nvim",
    build = ":UpdateRemotePlugins",
    ft = { "python" },
  },

  -- REPL support for Python (optional)
  {
    "hkupty/iron.nvim",
    config = function()
      require("iron.core").setup({
        config = {
          repl_definition = {
            python = {
              command = { "ipython" }
            },
          },
          repl_open_cmd = "botright split",
        },
        keymaps = {
          send_motion = "<leader>sc",
          send_line = "<leader>sl",
          send_file = "<leader>sf",
        },
      })
    end,
  },

  -- Python test runner integration
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-python",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-python")({
            dap = { justMyCode = false },
            runner = "pytest",
          }),
        },
      })
    end,
  },

  -- LSP alternative: Ruff via LSP
  {
    "astral-sh/ruff-lsp",
    ft = { "python" },
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.ruff_lsp.setup({
        init_options = {
          settings = {
            args = {}, -- customize args like --select or --ignore
          },
        },
      })
    end,
  },
}