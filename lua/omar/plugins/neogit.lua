return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
  },
  cmd = "Neogit",
  config = function()
    require("omar.config.neogit")  -- 👈 load external config

    -- Neogit Keymaps
    vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<CR>", { desc = "Open Neogit" })
    vim.keymap.set("n", "<leader>gc", "<cmd>Neogit commit<CR>", { desc = "Commit with Neogit" })
    vim.keymap.set("n", "<leader>gp", "<cmd>Neogit push<CR>", { desc = "Push with Neogit" })
    vim.keymap.set("n", "<leader>gl", "<cmd>Neogit pull<CR>", { desc = "Pull with Neogit" })
    vim.keymap.set("n", "<leader>gn", function()
      vim.ui.input({ prompt = "New branch name: " }, function(branch)
        if branch and branch ~= "" then
          vim.cmd("!git checkout -b " .. branch)
          print("Checked out new branch: " .. branch)
        else
          print("Branch creation cancelled.")
        end
      end)
    end, { desc = "Create and checkout new git branch" })
  end,
}

