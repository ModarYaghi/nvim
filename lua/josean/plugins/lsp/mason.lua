return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    -- Ensure essential LSP servers are installed
    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "tsserver", -- TypeScript LSP server
        "html", -- HTML LSP server
        "cssls", -- CSS LSP server
        "tailwindcss", -- Tailwind CSS LSP server
        "svelte", -- Svelte LSP server
        "lua_ls", -- Lua LSP server
        "graphql", -- GraphQL LSP server
        "emmet_ls", -- Emmet LSP server
        "prismals", -- Prisma LSP server
        "pyright",
        "bashls", -- For bash scripts
      },
    })

    -- Setup Mason Tools Installer to ensure key development tools are available
    mason_tool_installer.setup({
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "isort", -- python formatter
        "black", -- python formatter
        "pylint",
        "eslint_d",
        "flake8", -- Python linter and style checke
        "mypy", -- Stattic type checker for Python
        "jupytext", -- For Jupyter notebook support, if applicable
        "shellcheck", -- Linter for shell scripts
      },
      auto_update = true, -- Automatically update installed tools
    })
  end,
}
