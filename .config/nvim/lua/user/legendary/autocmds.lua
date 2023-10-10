local M = {}

function M.default_autocmds()
    return {
        {
            { 'BufRead', 'BufNewFile' },
            ':set filetype=twig.html',
            opts = {
                pattern = { '*.twig' },
            },
        },
        {
            { 'BufRead', 'BufNewFile' },
            ':set filetype=sh',
            opts = {
                pattern = { '.env*' },
            },
        }
    }
end

return M
