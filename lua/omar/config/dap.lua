local dap = require("dap")
local dapui = require("dapui")

-- Configure DAP UI
dapui.setup()

-- Automatically open/close DAP UI
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

-- Example: Configure Python adapter
dap.adapters.python = {
    type = "executable",
    command = "/path/to/python", -- Replace with your Python interpreter path
    args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
    {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}", -- Launch the current file
        pythonPath = function()
            return "/path/to/python" -- Replace with your Python interpreter path
        end,
   },
}