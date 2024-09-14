return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    init = function()
      vim.api.nvim_create_autocmd("BufWritePre", {
        callback = function()
          vim.lsp.buf.format()
        end,
      })
    end,
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    keys = {
      {
        "K",
        vim.lsp.buf.hover,
        desc = "Display information about the symbol under the cursor",
      },
      {
        "gd",
        vim.lsp.buf.definition,
        desc = "Go to definition",
      },
      {
        "crr",
        vim.lsp.buf.code_action,
        mode = { "n", "v" },
        desc = "List available code actions",
      },
      {
        "crn",
        vim.lsp.buf.rename,
        desc = "Renames all references to the symbol under the cursor",
      },
      {
        "<leader>=",
        vim.lsp.buf.format,
        desc = "Formats a buffer using the attached language server",
      },
    },
  },
}
