-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- move cursor between windows including tmux panes
vim.keymap.set("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", { desc = "Focus window left" })
vim.keymap.set("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", { desc = "Focus window down" })
vim.keymap.set("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", { desc = "Focus window up" })
vim.keymap.set("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", { desc = "Focus window left" })
vim.keymap.set("n", "<C-\\>", "<Cmd>NvimTmuxNavigateLastActive<CR>", { desc = "Focus last active window" })
vim.keymap.set("n", "<C-Space>", "<Cmd>NvimTmuxNavigateNext<CR>", { desc = "Focus next window" })
-- move cursor to middle of screen when paging up and down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- Reselect visual selection after indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
-- Maintian cursor position when yanking a visual selection
vim.keymap.set("v", "y", "myy`y")
-- Paste replace visual selection without copying it
vim.keymap.set("v", "p", '"_dP')
-- Spider config
vim.keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
vim.keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
vim.keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })

vim.keymap.set("n", "<F5>", "<Cmd>UndotreeToggle<CR>", { desc = "Toggle Undotree" })
