-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Space is my leader
vim.g.maplocalleader = " "

-- tabs are 4 spaces wide
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- vim.opt.completeopt = 'menuone,longest,preview'

vim.opt.title = true

vim.opt.listchars = { tab = "▸ ", trail = "·" }

vim.opt.scrolloff = 8

-- vim.opt.signcolumn = 'yes:2'

vim.opt.backup = true -- automatically save a backup file
vim.opt.backupdir:remove(".") -- keep backups out of the current directory
