-- lua/config/telescope.lua
local telescope = require("telescope")

telescope.setup({
    defaults = {
        prompt_prefix = "> ",
        selection_caret = ">> ",
        path_display = { "smart" },
        mappings = {
            i = {
                ["<C-n>"] = require("telescope.actions").cycle_history_next,
                ["<C-p>"] = require("telescope.actions").cycle_history_prev,
            },
        },
    },
    pickers = {
        find_files = {
            theme = "dropdown",
        },
    },
    extensions = {
        -- Add extensions here if needed
    },
})

-- Load the pytest_runner extension
pcall(require("telescope").load_extension, "pytest_runner")

-- Telescope Keymaps
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.git_files, {})     -- Ctrl + P to find git files
vim.keymap.set('n', '<leader>ff', builtin.find_files, {}) -- Ctrl + P to find files
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {}) -- Ctrl + Shift + F to search in files


-- Custom Pytest Runner shortcut
vim.keymap.set('n', '<leader>tp', function()
    require('telescope').extensions.pytest_runner()
end, { desc = "Run pytest preprocessor picker" }

-- Load Telescope extensions if any
-- telescope.load_extension("fzf")
