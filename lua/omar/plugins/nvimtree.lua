return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons", -- optional but recommended
    },
    config = function()
        require("omar.config.nvimtree")

        -- NvimTree Keymaps
        vim.keymap.set('n', '<leader>e', function()
            local view = require("nvim-tree.view")

            if not view.is_visible() then
                -- If NvimTree isn't visible, open it
                vim.cmd("NvimTreeOpen")
                return
            end

            local tree_win = view.get_winnr()
            local curr_win = vim.api.nvim_get_current_win()

            if curr_win == tree_win then
                -- You're in the tree → go to the right (your editor)
                vim.cmd("wincmd l")
            else
                -- You're in the editor → focus the tree
                vim.cmd("NvimTreeFocus")
            end
        end, { desc = "Toggle focus between NvimTree and editor" })

        -- pressing <leader>nf while in the tree will create a new file wherever you are
        vim.keymap.set("n", "<leader>nf", function()
            local api = require("nvim-tree.api")
            local node = api.tree.get_node_under_cursor()
            local path = node and (node.type == "directory" and node.absolute_path or vim.fn.fnamemodify(node.absolute_path, ":h")) or vim.fn.getcwd()

            vim.ui.input({ prompt = "New file name: ", default = path .. "/" }, function(input)
                if input and input ~= "" then
                    vim.cmd("e " .. input)
                end
            end)
        end, { desc = "Create new file from NvimTree location" })

        vim.keymap.set("n", "<leader>th", ":NvimTreeToggleDotfiles<CR>", { desc = "Toggle hidden files in NvimTree" })
    end,
}

