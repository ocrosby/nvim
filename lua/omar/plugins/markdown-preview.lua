return {
  "iamcco/markdown-preview.nvim",
  build = "cd app && npm install",
  cmd = { "MarkdownPreview", "MarkdownPreviewToggle" },
  ft = { "markdown" }, -- Only load for markdown files
  config = function()
    require("omar.config.markdown-preview")
  end,
}
