-- lua/omar/utils/telescope_keymaps.lua

local M = {}

function M.leader_keymaps_picker()
    local builtin = require("telescope.builtin")
    local pickers = require("telescope.pickers")
    local finders = require("telescope.finders")
    local previewers = require("telescope.previewers")
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")
    local conf = require("telescope.config").values

    local leader_keymaps = {}

    -- Get all keymaps
    for _, map in ipairs(vim.api.nvim_get_keymap("n")) do
        if vim.startswith(map.lhs, "<leader>") then
            table.insert(leader_keymaps, {
                lhs = map.lhs,
                rhs = map.rhs,
                desc = map.desc or "No description",
            })
        end
    end

    pickers.new({}, {
        prompt_title = "Leader Keymaps",
        finder = finders.new_table({
            results = leader_keymaps,
            entry_maker = function(entry)
                return {
                    value = entry,
                    display = string.format("%-20s %s", entry.lhs, entry.desc),
                    ordinal = entry.lhs .. " " .. entry.desc,
                }
            end,
        }),
        sorter = conf.generic_sorter({}),
        previewer = previewers.new_buffer_previewer({
            define_preview = function(self, entry)
                local lines = {
                    "Key: " .. entry.value.lhs,
                    "Command: " .. (entry.value.rhs or "None"),
                    "Description: " .. (entry.value.desc or "No description"),
                }
                vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, lines)
            end,
        }),
        attach_mappings = function(prompt_bufnr, map)
            map("i", "<CR>", function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                if selection then
                    vim.cmd(selection.value.rhs)
                end
            end)
            return true
        end,
    }):find()
end

return M