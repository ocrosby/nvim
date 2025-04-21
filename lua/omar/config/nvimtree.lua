
local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
    vim.api.nvim_echo({ { "nvim-tree is not installed!", "WarningMsg" } }, true, {})
    return
end

require("nvim-tree").setup({
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = {
        enable = true,
        update_root = true,
    },
    disable_netrw = true, -- Disable netrw
    hijack_netrw = true,  -- Hijack netrw window
    renderer = {
        highlight_opened_files = "name", -- Highlight opened files
        highlight_git = true, -- Highlight git changes
        icons = {
            show = {
                git = true,
                folder = true,
                file = true,
                folder_arrow = true,
            },
        },
    },
    filesystem_watchers = {
        enable = true, -- Enable filesystem watchers
        debounce_delay = 50, -- Debounce delay in milliseconds
    },
    diagnostics = {
        enable = true, -- Enable diagnostics
        show_on_dirs = true,
    },
    view = {
        adaptive_size = true, -- Adjust size to fit content
        width = 30, -- Set tree width
        side = "left", -- Open tree on the left
    },
    filters = {
        dotfiles = true, -- Show dotfiles
        custom = { ".git", "node_modules", ".cache" }, -- Ignore .git folder, node_modules, and .cache
    },
})

-- user command to toggle dotfiles
vim.api.nvim_create_user_command("NvimTreeToggleDotfiles", function()
    local ok, api = pcall(require, "nvim-tree.api")
    if not ok then
        vim.notify("nvim-tree not loaded!", vim.log.levels.WARN)
        return
    end

    local current = vim.g.nvimtree_show_dotfiles or false
    vim.g.nvimtree_show_dotfiles = not current

    api.tree.toggle_hidden_filter()
    api.tree.reload()

    if vim.g.nvimtree_show_dotfiles then
        vim.notify("Showing hidden files (dotfiles)", vim.log.levels.INFO)
    else
        vim.notify("Hiding hidden files (dotfiles)", vim.log.levels.INFO)
    end
end, { desc = "Toggle showing dotfiles in NvimTree" })

