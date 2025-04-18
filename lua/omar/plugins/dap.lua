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
        end,
    },
}
