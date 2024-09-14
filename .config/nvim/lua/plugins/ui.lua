return {
  --Base - 16 - nvim
  --  {
  --      "RRethy/base16-nvim",
  --      config = function()
  --          require('base16-colorscheme').with_config({
  --              telescope = false,
  --              telescope_borders = false,
  --              indentblankline = false,
  --              notify = true,
  --              ts_rainbow = false,
  --              cmp = false,
  --              illuminate = false,
  --              lsp_semantic = false,
  --              mini_completion = false,
  --              dapui = false,
  --          })
  --      end,
  --      init = function()
  --          require("base16-colorscheme").setup({
  --              base00 = '#161616',
  --              base01 = '#262626',
  --              base02 = '#393939',
  --              base03 = '#525252',
  --              base04 = '#b4b7b4',
  --              base05 = '#c5c8c6',
  --              base06 = '#e0e0e0',
  --              base07 = '#ffffff',
  --              base08 = '#AC4242',
  --              base09 = '#F4BF75',
  --              base0A = '#F4BF75',
  --              base0B = '#90A959',
  --              base0C = '#75B5AA',
  --              base0D = '#6A9FB5',
  --              base0E = '#AA759F',
  --              base0F = '#C28CB8'
  --          })
  --      end,
  --  },
  --
  -- Oxocarbon
  {
    "nyoom-engineering/oxocarbon.nvim",
    config = function()
      require("oxocarbon")
    end,
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

  -- Lualine
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({ options = { theme = "auto" } })
    end,
  },

  --Bufferline
  {
    "akinsho/bufferline.nvim",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "famiu/bufdelete.nvim",
    },
    config = function()
      require("bufferline").setup({
        options = {
          close_command = "Bdelete",
          numbers = "none",
          middle_mouse_command = nil,
          indicator_icon = nil,
          indicator = { style = "none" },
          buffer_close_icon = "󰅖",
          modified_icon = "●",
          close_icon = "",
          left_trunc_marker = "",
          right_trunc_marker = "",
          max_name_length = 30,
          max_prefix_length = 30,
          tab_size = 21,
          diagnostics = false, -- | "nvim_lsp" | "coc",
          diagnostics_update_in_insert = false,
          offsets = { { filetype = "NvimTree", text = "[ NvimTree ]", padding = 1 } },
          show_buffer_icons = true,
          show_buffer_close_icons = true,
          show_close_icon = true,
          show_tab_indicators = true,
          persist_buffer_sort = true,
          separator_style = "thin",
          enforce_regular_tabs = true,
          always_show_bufferline = true,
        },
      })
    end,
  },

  -- NvimTree
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        update_focused_file = {
          enable = true,
          update_cwd = true,
        },
        diagnostics = {
          enable = false,
          show_on_dirs = false,
        },
        view = {
          width = 25,
          side = "left",
        },
      })
    end,
    keys = {
      { "<f8>", "<CMD>NvimTreeToggle<CR>", desc = "Toggle nvim tree" },
    },
  },
}
