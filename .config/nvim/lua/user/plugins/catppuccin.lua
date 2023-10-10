require("catppuccin").setup {
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    -- term_colors = true,
    -- transparent_background = false,
    -- no_italic = false,
    -- no_bold = false,
    -- styles = {
    --     comments = {},
    --     conditionals = {},
    --     loops = {},
    --     functions = {},
    --     keywords = {},
    --     strings = {},
    --     variables = {},
    --     numbers = {},
    --     booleans = {},
    --     properties = {},
    --     types = {},
    -- },
    -- color_overrides = {
    --     mocha = {
    --         base = "#000000",
    --         mantle = "#000000",
    --         crust = "#000000",
    --     },
    -- },
    -- highlight_overrides = {
    --     mocha = function(C)
    --         return {
    --             TabLineSel = { bg = C.pink },
    --             CmpBorder = { fg = C.surface2 },
    --             Pmenu = { bg = C.none },
    --             TelescopeBorder = { link = "FloatBorder" },
    --         }
    --     end,
    -- },
}

vim.cmd.colorscheme "catppuccin"

vim.api.nvim_set_hl(0, 'StatusLineNonText', {
        fg = vim.api.nvim_get_hl_by_name('NonText', true).foreground,
        bg = vim.api.nvim_get_hl_by_name('StatusLine', true).background,
    })

vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = '#414558' })

