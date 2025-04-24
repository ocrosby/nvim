-- lua/omar/plugins/zenmode.lua
return {
    "folke/zen-mode.nvim",
    config = function()
        require("omar.config.zenmode").setup()

        --- Zen Mode Keymaps
        vim.keymap.set("n", "<leader>zz", ":ZenMode<CR>", { desc = "Toggle Zen Mode" })
        vim.keymap.set("n", "<leader>zq", ":ZenMode<CR>:q<CR>", { desc = "Toggle Zen Mode and quit" })
    end,
}
