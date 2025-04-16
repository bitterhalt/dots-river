return {

  -- fzfm
  {
    "rolv-apneseth/tfm.nvim",
    cmd = "Tfm",
    opts = {
      file_manager = "lf",
      replace_netrw = true,
      enable_cmds = true,
      ui = {
        border = "single",
        height = 1,
        width = 1,
        x = 0.5,
        y = 0.5,
      },
    },
    keys = {
      {
        "<leader>e",
        "<Cmd>Tfm<CR>",
        desc = "Open file manager",
      },
    },
  },

  --Which-key
  {
    "folke/which-key.nvim",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      icons = {
        breadcrumb = ">",
        separator = ">",
        group = "+",
      },
    },
    event = "VeryLazy",
  },

  -- Noice
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      config = function()
        require("noice").setup({
          -- add any options here
          routes = {
            {
              filter = {
                event = { "" },
                kind = "",
                find = "written",
              },
              opts = { skip = true },
            },
          },
        })
      end,
    },
  },

  -- FzfLua
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "FzfLua",
    opts = {},
    keys = {
      {
        "<leader>ff",
        "<Cmd>FzfLua files<CR>",
        desc = "Search files",
      },
      {
        "<leader>fd",
        "<Cmd>FzfLua diagnostics_document<CR>",
        desc = "Show diagnostics",
      },
      {
        "<leader><tab>",
        "<Cmd>FzfLua buffers<CR>",
        desc = "Search buffers",
      },
      {
        "<leader>fw",
        "<Cmd>FzfLua live_grep<CR>",
        desc = "Search for a pattern",
      },
      {
        "<leader>fr",
        "<Cmd>FzfLua oldfiles<CR>",
        desc = "Search recnt files",
      },
      {
        "<leader>fz",
        "<Cmd>FzfLua zoxide<CR>",
        desc = "List recent directories",
      },
    },
  },

  -- Persistence
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    config = true,
    keys = {
      {
        "<leader>ss",
        function()
          return require("persistence").load()
        end,
        desc = "Restore the last session",
      },
      {
        "<leader>sl",
        function()
          return require("persistence").select()
        end,
        desc = "Select session",
      },
    },
  },
}
