return {

  {
    -- ZenMode
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      window = {
        backdrop = 0.95,
        width = 140,
        height = 1,
        options = {},
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },

  -- fzfm
  {
    "rolv-apneseth/tfm.nvim",
    opts = {
      file_manager = "yazi",
      replace_netrw = false,
      enable_cmds = true,
      ui = {
        border = "single",
        height = 0.9,
        width = 0.9,
      },
    },
    lazy = true,
    keys = {
      {
        "<leader>ee",
        "<Cmd>Tfm<CR>",
        desc = "Open file manager",
      },
      {
        "<leader>es",
        "<Cmd>TfmSplit<CR>",
        desc = "Open file manager (horizontal split)",
      },
      {
        "<leader>ev",
        "<Cmd>TfmVsplit<CR>",
        desc = "Open file manager (vertical split)",
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

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = function()
      return {
        defaults = {
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              prompt_position = "bottom",
              preview_width = 0.5,
            },
            width = 0.7,
            height = 0.7,
          },
        },
      }
    end,
    keys = {
      { "<leader>ff", "<CMD>Telescope find_files <CR>", desc = "Find Files" },
      { "<leader>fa", "<CMD>Telescope find_files hidden=true <CR>", desc = "Find Also Hidden Files" },
      { "<leader><tab>", "<CMD>Telescope buffers <CR>", desc = "List buffers" },
      { "<leader>fr", "<CMD>Telescope oldfiles <CR>", desc = "Find recent files" },
      { "<leader>fw", "<CMD>Telescope live_grep <CR>", desc = "Live Grep" },
      { "<leader>ht", "<CMD>Telescope colorscheme <CR>", desc = "Browse themes" },
    },
  },

  -- Persistence
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    config = true,
    keys = {
      {
        "<leader>s",
        function()
          return require("persistence").load({ last = true })
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
