return {
    {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "lua", "python", "javascript", "go", "html", "css" }, -- Add languages you need
                highlight = {
                    enable = true, -- Enable syntax highlighting
                },
                indent = {
                    enable = true, -- Enable indentation
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "gnn",
                        node_incremental = "grn",
                        scope_incremental = "grc",
                        node_decremental = "grm",
                    },
                },
            })

            -- Tree-sitter Incremental Selection
            vim.keymap.set("n", "gnn", ":lua require'nvim-treesitter.incremental_selection'.init_selection()<CR>", { desc = "Init selection" })
            vim.keymap.set("n", "grc", ":lua require'nvim-treesitter.incremental_selection'.scope_incremental()<CR>", { desc = "Scope incremental" })
            vim.keymap.set("n", "grm", ":lua require'nvim-treesitter.incremental_selection'.node_decremental()<CR>", { desc = "Node decremental" })

            vim.keymap.set('n', "<leader>gb", "<cmd>Telescope git_branches<CR>", { desc = "Git branches" })
            vim.keymap.set('n', '<leader>ps', "<cmd>Telescope grep_string<CR>", { desc = "Grep for string" })
        end,
    },
}
