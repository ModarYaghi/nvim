return {
  "nvim-orgmode/orgmode",
  event = "VeryLazy",
  ft = { "org" },
  config = function()
    -- Setup orgmod
    require("orgmode").setup({
      org_agenda_files = "/mnt/d/hi_notes/org/**/*",
      org_default_notes_file = "/mnt/d/hi_notes/org/refile.org",
    })

    -- For nvim-treesitter with ~ensure_installed = "all"~ option
    -- add ~org~ to ignore_install
    require("nvim-treesitter.configs").setup({
      ensure_installed = "all",
      ignore_install = { "org" },
    })
  end,
}
