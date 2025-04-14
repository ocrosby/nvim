require("catppuccin").setup({
    flavour = "mocha", -- Choose your preferred flavor: latte, frappe, macchiato, mocha
    integrations = {
        treesitter = true,
        lsp_trouble = true,
        telescope = true,
        neotree = true,
        --gitsigns = true,
        --nvimtree = true,
        --lualine = true,
        --cmp = true,
        --dap = true,
    },
})