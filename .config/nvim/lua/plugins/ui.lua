return {
  -- Oxocarbon
  {
    "nyoom-engineering/oxocarbon.nvim",
    config = function()
      require("oxocarbon")
    end,
  },

  -- Lualine
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto",
          disabled_filetypes = {
            statusline = { "dashboard", "alpha", "ministarter" },
          },
        },
      })
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

  -- Mini starter
  {
    "echasnovski/mini.starter",
    lazy = false,
    config = true,
    opts = {
      header = "⚡ Neovim",
      footer = "",
      items = {
        { name = "n New file", action = ":ene | startinsert", section = "" },
        { name = "r Recent files", action = ":Telescope oldfiles", section = "" },
        { name = "f Find files", action = ":Telescope find_files", section = "" },
        { name = "l Lazy", action = ":Lazy", section = "" },
        { name = "s Restore session", action = ":lua require('persistence').load()", section = "" },
        { name = "q Quit", action = ":qa!", section = "" },
      },
    },
  },
}
