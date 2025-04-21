-- lua/omar/config/markdown_preview.lua

vim.g.mkdp_auto_start = 0 -- Do not auto-start preview on opening markdown
vim.g.mkdp_auto_close = 1 -- Auto-close preview when you leave buffer
vim.g.mkdp_refresh_slow = 0 -- Auto-refresh when saving
vim.g.mkdp_command_for_global = 0 -- Only start preview per file, not globally
vim.g.mkdp_browser = "" -- Let it open in system default browser
vim.g.mkdp_theme = "dark" -- Preview in dark mode

-- Optional: Open preview with a keymap
vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Toggle Markdown Preview" })

