
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
        custom = { ".git" }, -- Ignore .git folder
    },
})

