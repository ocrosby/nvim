-- lua/omar/plugins/neotest.lua

return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-neotest/neotest-python",
        },
        config = function()
            require("omar.config.neotest") -- 👈 your config module

            -- Keymaps for Neotest
            vim.keymap.set("n", "<leader>tt", function()
                require("neotest").run.run()
            end, { noremap = true, silent = true, desc = "Run nearest test" })

            vim.keymap.set("n", "<leader>tT", function()
                require("neotest").run.run(vim.fn.expand("%"))
            end, { noremap = true, silent = true, desc = "Run entire test file" })

            vim.keymap.set("n", "<leader>ts", function()
                require("neotest").summary.toggle()
            end, { noremap = true, silent = true, desc = "Toggle test summary" })

            vim.keymap.set("n", "<leader>to", function()
                require("neotest").output.open({ enter = true })
            end, { noremap = true, silent = true, desc = "Show test output" })

            vim.keymap.set("n", "<leader>tw", function()
                require("neotest").watch.toggle(vim.fn.expand("%"))
            end, { noremap = true, silent = true, desc = "Toggle watch file" })
        end,
    },
}