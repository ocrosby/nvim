return {
    {
        "epwalsh/obsidian.nvim",
        version = "*", -- Use the latest release
        lazy = true,
        ft = "markdown", -- Load only for markdown files
        -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
        -- event = {
        --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
        --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
        --   -- refer to `:h file-pattern` for more examples
        --   "BufReadPre path/to/my-vault/*.md",
        --   "BufNewFile path/to/my-vault/*.md",
        -- },
        dependencies = {
            "nvim-lua/plenary.nvim", -- Required dependency
        },
        config = function()
            require("omar.config.obsidian") -- Load the plugin-specific configuration

            --- Obsidian Keymaps
            vim.keymap.set("n", "<leader>oo", ":ObsidianOpen<CR>", { desc = "Open Obsidian note" })
            vim.keymap.set("n", "<leader>ot", ":ObsidianToday<CR>", { desc = "Open today's note" })
            vim.keymap.set("n", "<leader>on", ":ObsidianNew<CR>", { desc = "Create a new note" })
            vim.keymap.set("n", "<leader>os", ":ObsidianSearch<CR>", { desc = "Search notes" })
            vim.keymap.set("n", "<leader>ob", ":ObsidianBacklinks<CR>", { desc = "Show backlinks" })
            vim.keymap.set("n", "<leader>ol", ":ObsidianLink<CR>", { desc = "Create a link to another note" })
            vim.keymap.set("n", "<leader>of", ":ObsidianFollowLink<CR>", { desc = "Follow a link" })
        end,
    },
}