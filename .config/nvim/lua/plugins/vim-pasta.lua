-- Automatically fix indentation when pasting code.
return {
    {
        'sickill/vim-pasta',
        config = function()
            vim.g.pasta_disabled_filetypes = { 'fugitive' }
        end,
    }
}

