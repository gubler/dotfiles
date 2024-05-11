require('nvim-treesitter.configs').setup({
    ensure_installed = {
        'bash',
        'comment',
        'css',
        'diff',
        'git_rebase',
        'gitattributes',
        'gitcommit',
        'gitignore',
        'html',
        'ini',
        'javascript',
        'jsdoc',
        'json',
        'lua',
        'markdown',
        'markdown_inline',
        'mermaid',
        'php',
        'phpdoc',
        'query',
        'rust',
        'scss',
        'sql',
        'twig',
        'typescript',
        'vim',
        'yaml',
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
        disable = {'blueprint', 'jsonc', 'fusion'}
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ['if'] = '@function.inner',
                ['af'] = '@function.outer',
                ['ia'] = '@parameter.inner',
                ['aa'] = '@parameter.outer',
            },
        }
    },
    rainbow = {
        enable = true,
        query = 'rainbow-parens',
        strategy = require 'ts-rainbow.strategy.global',
    }
})

require('ts_context_commentstring').setup {
  enable_autocmd = false,
  languages = {
    typescript = '// %s',
  },
}
