return {
  -- Oxocarbon
  {
    "nyoom-engineering/oxocarbon.nvim",
  },
  -- load theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "oxocarbon",
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

  -- Lualine
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
      require("lualine").setup({ options = { theme = "auto" } })
    end,
  },

  --Bufferline
  {
    "akinsho/bufferline.nvim",
    version = "*",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "famiu/bufdelete.nvim",
    },
    opts = {
      options = {
        close_command = function(n)
          LazyVim.ui.bufremove(n)
        end,
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
    },
  },

  -- NvimTree
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = true,
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
  -- Dashboard
  {
    "nvimdev/dashboard-nvim",
    lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
    opts = function()
      local logo = [[
     LazyVim
     https://www.lazyvim.org
    ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"

      local opts = {
        theme = "doom",
        hide = {
          -- this is taken care of by lualine
          -- enabling this messes up the actual laststatus setting after loading a file
          statusline = false,
        },
        config = {
          header = vim.split(logo, "\n"),
        -- stylua: ignore
        center = {
          { action = 'lua LazyVim.pick()()',                           desc = " Find File",        key = "f" },
          { action = "ene | startinsert",                              desc = " New File",         key = "n" },
          { action = 'lua LazyVim.pick("oldfiles")()',                 desc = " Recent Files",     key = "r" },
          { action = 'lua LazyVim.pick("live_grep")()',                desc = " Find Text",        key = "g" },
          { action = 'lua LazyVim.pick.config_files()()',              desc = " Config",           key = "c" },
          { action = 'lua require("persistence").load()',              desc = " Restore Session",  key = "s" },
          { action = "LazyExtras",                                     desc = " Lazy Extras",      key = "x" },
          { action = "Lazy",                                           desc = " Lazy",             key = "l" },
          { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit",             key = "q" },
        },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { "Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
          end,
        },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
        button.key_format = "  %s"
      end

      -- open dashboard after closing lazy
      if vim.o.filetype == "lazy" then
        vim.api.nvim_create_autocmd("WinClosed", {
          pattern = tostring(vim.api.nvim_get_current_win()),
          once = true,
          callback = function()
            vim.schedule(function()
              vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
            end)
          end,
        })
      end

      return opts
    end,
  },
}
