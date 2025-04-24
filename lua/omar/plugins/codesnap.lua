return {
  "mistricky/codesnap.nvim",
  build = "make",
  lazy = true,
  cmd = "CodeSnap",
  config = function()
    require("omar.config.codesnap")

    -- Codesnap Keymaps
    vim.keymap.set("v", "<leader>cs", ":CodeSnap<CR>", { desc = "Take CodeSnap Screenshot" })
  end,
}

