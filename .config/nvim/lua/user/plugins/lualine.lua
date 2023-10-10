require('lualine').setup({
  options = {
    globalstatus = true,
  },
  sections = {
    lualine_a = {
      'mode',
    },
    lualine_b = {
      'branch',
      'diff',
      '" ".. tostring(#vim.tbl_keys(vim.lsp.buf_get_clients()))',
      { 'diagnostics', sources = { 'nvim_diagnostic' } },
    },
    lualine_c = {
      'filename'
    },
    lualine_x = {
        "vim.fn['zoom#statusline']()",
        'filetype',
      -- 'encoding',
      -- 'fileformat',
    },
    lualine_y = {
      'encoding',
      'fileformat',
      -- '(vim.bo.expandtab and "␠ " or "⇥ ") .. " " .. vim.bo.shiftwidth',
    },
    lualine_z = {
      'location',
      'progress',
    },
  },
})
