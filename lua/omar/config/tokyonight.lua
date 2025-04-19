require("tokyonight").setup({
    style = "storm", -- Options: storm, night, day, moon
    transparent = false, -- Disable background transparency
    terminal_colors = true, -- Enable terminal colors
    styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = "dark", -- Darker background for sidebars
        floats = "dark", -- Darker background for floating windows
    },
    sidebars = { "qf", "help", "terminal", "packer" }, -- Sidebar windows
    dim_inactive = false, -- Do not dim inactive windows
    lualine_bold = true, -- Use bold text in lualine
})

-- Apply the colorscheme
vim.cmd.colorscheme("tokyonight")
