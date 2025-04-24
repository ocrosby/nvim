return {
    "github/copilot.vim",
    config = function()
       require("omar.config.copilot") -- Load the Copilot configuration

        -- Copilot Keymaps
        vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true, desc = "Accept Copilot suggestion" })
        vim.api.nvim_set_keymap("i", "<C-K>", 'copilot#Dismiss()', { silent = true, expr = true, desc = "Dismiss Copilot suggestion" })
        vim.api.nvim_set_keymap("i", "<C-Space>", 'copilot#Complete()', { silent = true, expr = true, desc = "Trigger Copilot completion" })
        vim.keymap.set("n", "<leader>cp", ":Copilot toggle<CR>", { desc = "Toggle Copilot" })
    end
}