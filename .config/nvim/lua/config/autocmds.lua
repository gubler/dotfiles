-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.twig", "*.html.twig", "*.json.twig", "*.xml.twig" },
  callback = function()
    vim.api.nvim_cmd({ cmd = "setf", args = { "twig" } }, {})
  end,
})
