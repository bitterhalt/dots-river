-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Interface
vim.opt.colorcolumn = "80"
vim.opt.cursorline = true
vim.opt.laststatus = 2
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.syntax = "on"
vim.opt.termguicolors = true

-- Behavior
vim.opt.clipboard = "unnamedplus"
vim.opt.confirm = true
vim.opt.scrolloff = 4
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Indentation
vim.opt.shiftwidth = 4
vim.opt.softtabstop = -1
vim.opt.expandtab = true

-- Line wrapping
vim.opt.breakindent = true
vim.opt.linebreak = true

-- Searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

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