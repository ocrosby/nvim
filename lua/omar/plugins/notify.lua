return {
    "rcarriga/nvim-notify",
    lazy = true,
    config = function()
        local notify_config = require("omar.config.notify")
        require("notify").setup(notify_config)
        vim.notify = require("notify") -- Set `vim.notify` to use `nvim-notify`
    end,
}