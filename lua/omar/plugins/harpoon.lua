return {
    {
        "ThePrimeagen/harpoon",
        config = function()
            require("omar.config.harpoon") -- Load the Harpoon configuration

            -- Harpoon Keymaps
            local ok_mark, mark = pcall(require, "harpoon.mark")
            local ok_ui, ui = pcall(require, "harpoon.ui")

            if ok_mark and ok_ui then
                vim.keymap.set("n", "<leader>ha", mark.add_file, { desc = "Add file to Harpoon" })
                vim.keymap.set("n", "<leader>h1", function() ui.nav_file(1) end, { desc = "Navigate to Harpoon file 1" })
                vim.keymap.set("n", "<leader>h2", function() ui.nav_file(2) end, { desc = "Navigate to Harpoon file 2" })
                vim.keymap.set("n", "<leader>h3", function() ui.nav_file(3) end, { desc = "Navigate to Harpoon file 3" })
                vim.keymap.set("n", "<leader>h4", function() ui.nav_file(4) end, { desc = "Navigate to Harpoon file 4" })
            end
        end,
    },
}