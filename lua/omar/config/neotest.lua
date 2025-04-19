-- lua/omar/config/neotest.lua

local neotest = require("neotest")

neotest.setup({
    adapters = {
        require("neotest-python")({
            dap = { justMyCode = false },
            runner = "pytest",
            args = { "--tb=short", "-q" },
        }),
    },
})
