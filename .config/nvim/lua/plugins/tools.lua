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

  --Which-key
  {
    "folke/which-key.nvim",
    -- Defaults from LazyVim
  },

  -- Noice
  {
    -- Defaults from LazyVim
    "folke/noice.nvim",
  },
}
