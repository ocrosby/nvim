return {
  "iamcco/markdown-preview.nvim",
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  cmd = { "MarkdownPreview", "MarkdownPreviewToggle" },
  ft = { "markdown" }, -- Only load for markdown files
  config = function()
    require("omar.config.markdown-preview")
  end,
}
