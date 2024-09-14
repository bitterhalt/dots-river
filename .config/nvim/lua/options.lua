-- Opts
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
vim.opt.termguicolors = true
vim.opt.scrolloff = 4
vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.cindent = true
vim.opt.autoindent = true
vim.opt.wrap = true
vim.opt.textwidth = 300
vim.opt.list = true
vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.history = 50
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.mouse = "a"

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
  command = "%s/\\s\\+$//e",
})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ igroup = "IncSearch", timeout = 150, on_visual = true })
  end,
})
