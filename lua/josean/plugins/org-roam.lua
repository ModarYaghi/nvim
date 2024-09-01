return {
  "chipsenkbeil/org-roam.nvim",
  tag = "0.1.0",
  dependencies = {
    {
      "nvim-orgmode/orgmode",
      tag = "0.3.4",
    },
  },
  config = function()
    require("org-roam").setup({
      directory = "/mnt/d/hi_notes/org_roam",
      -- optional
      org_files = {
        "/mnt/d/hi_notes/org",
        "/mnt/d/hi_notes/notes/*.org",
        "/mnt/d/hi_notes/SingleNote.org",
      },
    })
  end,
}
