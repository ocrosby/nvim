return {
    "rcarriga/nvim-notify",
    lazy = true,
    config = function()
        -- Import your static config
        local notify_config = require("omar.config.notify")
        local notify = require("notify")

        -- Setup initially
        notify.setup(notify_config)

        -- Set vim.notify globally
        vim.notify = notify

        -- Helper function to dynamically calculate background
        local function get_notify_background()
            if vim.o.background == "light" then
                return "#EFF1F5" -- Latte (light theme)
            else
                return "#1E1E2E" -- Mocha (dark theme)
            end
        end

        -- Autocmd to reapply Notify setup on ColorScheme change
        vim.api.nvim_create_autocmd("ColorScheme", {
            callback = function()
                local notify_ok, notify_reloaded = pcall(require, "notify")
                if notify_ok then
                    notify_reloaded.setup(vim.tbl_extend("force", notify_config, {
                        background_colour = get_notify_background(),
                    }))
                end
            end,
        })
    end,
}