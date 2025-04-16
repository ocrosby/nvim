-- Bootstrap lazy.nvim
-- vim.fn.stdpath("data") resolves to the standard path for user-specific data files in Neovim.
-- This is typically `~/.local/share/nvim` on Unix-like systems.
-- On Windows, it may be something like `C:\Users\<username>\AppData\Local\nvim-data`.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    -- If lazy.nvim is not installed, clone it
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end

-- Prepend lazy.nvim to runtime path
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- import your plugins
        { import = "omar.plugins" }, -- Import the plugins directory from `lua/plugins/init.lua`
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = {
        missing = true, -- Automatically install missing plugins
        colorscheme = { "habamax" }
    },
    performance = {
        rtp = {
            reset = false, -- Keep runtime path modifications minimal
        }
    },
    ui = {
        border = "rounded", -- Use rounded borders for floating windows
        icons = {
            cmd = "⌘",
            config = "🛠️",
            event = "📅",
            ft = "📂",
            init = "⚙️",
            keys = "⌨️",
            lazy = "🌀",
            loaded = "✅",
            not_loaded = "❌",
            plugin = "📦",
            runtime = "🗂️",
            source = "📜",
            start = "🚀",
            task = "📝",
            list = {
                ["-"] = "-",
                ["+"] = "+",
                ["*"] = "*"
            }
        }
    },
    -- automatically check for plugin updates
    checker = { enabled = true },
})

-- After this call to `lazy.setup()`, you can use any of the plugins

