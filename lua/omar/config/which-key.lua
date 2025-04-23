local which_key = require("which-key")

which_key.setup({
  -- you can customize here if you want
  plugins = {
    marks = true,
    registers = true,
    spelling = {
      enabled = true,
      suggestions = 20,
    },
  },
  win = {
    border = "rounded",
    position = "bottom",
    margin = { 1, 0, 1, 0 },
    padding = { 1, 2, 1, 2 },
  },
  layout = {
    spacing = 4, 
    align = "left",
  },
})

which_key.add({
    { "<leader>d", group="Debug" },
    { "<leader>f", group="Find" },
    { "<leader>g", group="Git" },
    { "<leader>h", group="Harpoon" },
    { "<leader>o", group="Obsidian" },
    { "<leader>p", group="Pomodoro" },
    { "<leader>s", group="Session" },
    { "<leader>t", group="Test" },
    { "<leader>w", group="Window" },
    { "<leader>x", group="Trouble" },
})

