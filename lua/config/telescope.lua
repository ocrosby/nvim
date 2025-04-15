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

-- Load Telescope extensions if any
-- telescope.load_extension("fzf")