return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" }, -- Required dependency
    config = function()
        require("omar.config.telescope") -- Load the configuration from `lua/config/telescope.lua`

        -- Telescope Keymaps
        vim.keymap.set("n", "<leader>?", function()
            require("omar.utils.telescope_keymaps").leader_keymaps_picker()
        end, { noremap = true, silent = true, desc = "Search Leader Keymaps" })
    end,
}