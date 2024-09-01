return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "PreservedBoard",
        path = "/mnt/c/Users/fmnya/PreservedBoard",
      },
    },
  },
}
