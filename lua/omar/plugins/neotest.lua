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
        end,
    },
}