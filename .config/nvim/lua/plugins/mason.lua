return {
  -- Mason.nvim
  {
    "williamboman/mason.nvim",
    dependencies = {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    config = function()
      local mason = require("mason")
      local mason_tool_installer = require("mason-tool-installer")

      mason.setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
      mason_tool_installer.setup({
        ensure_installed = {
          "prettier", -- prettier formatter
          "stylua", -- lua formatter
          "isort", -- python formatter
          "black", -- python formatter
          "pylint", -- python linter
          "eslint_d", -- js linter
          "shellcheck",
          "shfmt",
        },
      })
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
    opts = {
      ensure_installed = {
        "bashls",
        "html",
        "lua_ls",
        "pylsp",
        "ts_ls",
      },
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end,

        ["html"] = function()
          require("lspconfig").html.setup({
            filetypes = { "html", "htmldjango" },
          })
        end,

        -- Run :PylspInstall python-lsp-isort
        ["pylsp"] = function()
          require("lspconfig").pylsp.setup({
            settings = {
              pylsp = {
                plugins = {
                  rope_autoimport = {
                    enabled = true,
                  },
                },
              },
            },
          })
        end,

        ["lua_ls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.lua_ls.setup({
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
              },
            },
          })
        end,
      },
    },
  },

  {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          null_ls.builtins.completion.spell,
        },
      })
    end,
    lazy = true,
  },
}
