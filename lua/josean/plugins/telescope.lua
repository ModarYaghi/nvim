return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
    "folke/trouble.nvim", -- Ensure trouble is listed as dependency
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local transform_mod = require("telescope.actions.mt").transform_mod

    -- local trouble = require("trouble")
    -- local trouble_telescope = require("trouble.sources.telescope")

    require("trouble").setup() -- Setup trouble

    -- or create your custom action
    local custom_actions = transform_mod({
      open_trouble_qflist = function(prompt_bufnr)
        require("trouble").toggle("quickfix")
      end,
    })

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        -- the following lines to 'height = "95%", I (modar) added them to modify
        -- fzf ui. It becomes three squares: file preview, results, and find file or so.
        layout_strategy = "vertical",
        layout_config = {
          preview_height = 0.7,
          vertical = {
            size = {
              width = "95%",
              height = "95%",
            },
          },
        },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
            --
            -- NOTE: ME: adding the following lines--
            --
            -- ["<C-t>"] = trouble_telescope.open,
            -- [keymap] = actions.select_horizontal, -- open the selection in a new horizontal split
            -- [keymap] = actions.select_vertical, -- open the selection in a new vertical split
            -- [keymap] = actions.file_split, -- Perform file split on selection
            -- [keymap] = actions.file_vsplit, -- Perform file vsplit on selection
            -- [keymap] = actions.select_tab, -- open the selection in a new tab
            --
            ["<C-x>"] = actions.close, -- close the telescope window
          },
        },
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("todo-comments")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
    keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
    --
    -- NOTE: ME: the following keymap added by me
    --
    keymap.set(
      "n",
      "<leader>f/",
      "<cmd>Telescope current_buffer_fuzzy_find<cr>",
      { desc = "[/] Fuzzily searchin current buffer" }
    )
  end,
}
