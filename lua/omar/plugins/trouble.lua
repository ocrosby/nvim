return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional but nice
  cmd = { "TroubleToggle", "Trouble", "TroubleClose", "TroubleRefresh" }, -- lazy load on command
  config = function()
    require("omar.config.trouble")

    -- Trouble.nvim Keymaps
    vim.keymap.set("n", "<leader>xx", function()
      local trouble = require("trouble")

      -- Check if Trouble is already open
      if trouble.is_open() then
        -- If it is, close it
        trouble.close()
        return
      end

      -- If it's not open, toggle it with the default settings  k
      trouble.toggle("diagnostics")

      -- After a short delay, focus Trouble if it's visible
      vim.defer_fn(function()
        local view = vim.fn.win_findbuf(vim.fn.bufnr("Trouble"))
        if view and #view > 0 then
          vim.api.nvim_set_current_win(view[1])
        end
      end, 200) -- delay 200ms for Trouble to open

    end, { desc = "Toggle document + workspace diagnostics" })

    vim.keymap.set("n", "<leader>xw", function()
      require("trouble").toggle("workspace_diagnostics")
    end, { desc = "Workspace diagnostics" })

    vim.keymap.set("n", "<leader>xd", function()
      require("trouble").toggle("document_diagnostics")
    end, { desc = "Document diagnostics" })

    vim.keymap.set("n", "<leader>xr", function()
      require("trouble").toggle("lsp_references")
    end, { desc = "LSP references" })

    vim.keymap.set("n", "<leader>xl", function()
      require("trouble").toggle("loclist")
    end, { desc = "Location list" })

    vim.keymap.set("n", "<leader>xq", function()
      require("trouble").toggle("quickfix")
    end, { desc = "Quickfix list" })
  end,
}
