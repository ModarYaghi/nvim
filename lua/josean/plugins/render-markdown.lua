return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {},

  -- register 'markdown' as the parser for vimwiki files
  vim.treesitter.language.register("markdown", "vimwiki"),

  config = function()
    local rendermarkdown = require("render-markdown")

    rendermarkdown.setup({
      -- add vimwiki to the file_types configuration of this plugin
      file_types = {
        "markdown",
        "vimwiki",
      },
      code = {
        position = "left",
        width = "block",
        language_pad = 0,
        disable_background = {
          "diff",
        },
      },
      sign = {
        -- Turn on / off sing rendering
        enabled = false,
        -- Applies to background of sign text
        -- highlight = "RenderMarkdownSign",
      },

      -- Mimic org-indent-mode behavior by indenting everything under a heading
      -- based on the level of the heading. Indenting starts from level 2 headings
      -- onward.
      indent = {
        -- Turn on / off org-indent-node
        enabled = true,

        per_level = 2,
      },
    })
  end,
}
