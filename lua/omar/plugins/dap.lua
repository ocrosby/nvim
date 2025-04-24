return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui", -- UI for nvim-dap
            "theHamsta/nvim-dap-virtual-text", -- Virtual text for nvim-dap
            "nvim-neotest/nvim-nio", -- Required dependency for nvim-dap-ui
        },
        config = function()
            require("omar.config.dap") -- Load the DAP configuration

            -- Dap Keymaps
            vim.keymap.set("n", "<F5>", function() require("dap").continue() end, { desc = "Start/Continue Debugging" })
            vim.keymap.set("n", "<F10>", function() require("dap").step_over() end, { desc = "Step Over" })
            vim.keymap.set("n", "<F11>", function() require("dap").step_into() end, { desc = "Step Into" })
            vim.keymap.set("n", "<F12>", function() require("dap").step_out() end, { desc = "Step Out" })
            vim.keymap.set("n", "<leader>db", function() require("dap").toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
            vim.keymap.set("n", "<leader>dr", function() require("dap").repl.open() end, { desc = "Open REPL" })
        end,
    },
}
