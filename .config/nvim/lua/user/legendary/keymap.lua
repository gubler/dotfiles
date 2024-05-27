local M = {}

local function has_words_before()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

function M.default_keymaps()
    local h = require('legendary.toolbox')
    return {
        { '<leader>?', ':Legendary<CR>', description = 'Legendary Search' },
        { '<leader>S', ':set spell!<CR>', description = 'Toggle spellcheck' },
        { '<leader>q', ':Bdelete<CR>', description = 'Close buffer' },
        { '<C-d>', '<C-d>zz' },
        { '<C-u>', '<C-u>zz' },

        -- allow moving the cursor through wrapped lines using j and k,
        { 'j', 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true }, mode = { 'n', 'v' } },
        { 'k', 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true }, mode = { 'n', 'v' } },

        -- Reselect visual selection after indenting
        { '<', '<gv', mode = {'v'} },
        { '>', '>gv', mode = {'v'} },

        -- Maintian cursor position when yanking a visual selection
        { 'y', 'myy`y', mode = {'v'} },

        {
            '<A-j>',
            {
                i = '<Esc>:move .+1<CR>==gi',
                n = ':move .+1<CR>==',
                v = ":move '>+1<CR>gv=gv",
            },
            description = 'Move line(s) down'
        },

        {
            '<A-k>',
            {
                i = '<Esc>:move .-2<CR>==gi',
                n = ':move .-2<CR>==',
                v = ":move '<-2<CR>gv=gv",
            },
            description = 'Move line(s) up'
        },
        -- {
        --     '<C-b>',
        --     {
        --         n = '<C-^>',
        --         i = '<ESC><C-^>',
        --     },
        --     description = 'Jump back to last edited buffer',
        --     opts = { noremap = true }
        -- },

        -- Paste replace visual selection without copying it
        { 'p', '"_dP', mode = {'v'} },

        { '<leader>x', ':!xdg-open %<CR><CR>', description = 'Open current file in default program' },

        { '<leader>a', ':SymbolsOutline<CR>', description = 'Toggle Symbols Outline pane' },

        { '<leader>N', ':Scratch<CR>', description = 'Open Scratch file' },
        { '<leader>n', ':NvimTreeFindFileToggle<CR>', description = 'Toggle NvimTree' },
        {
            'gx',
            function()
                local url = vim.fn.expand('<cfile>')
                -- plugin paths as interpreted by plugin manager, e.g. mrjones2014/op.nvim
                if not string.match(url, '[a-z]*://[^ >,;]*') and string.match(url, '[%w%p\\-]*/[%w%p\\-]*') then
                    url = string.format('https://github.com/%s', url)
                end
                vim.fn.jobstart({ 'open', url }, { detach = true })
            end,
            description = 'Open URL under cursor',
        },
        {
            '<F1>',
            {
                t = '<C-\\><C-n>:FloatermToggle<CR>',
                n = ':FloatermToggle<CR>',
            },
            description = 'Toggle FloatTerm',
        },
        {'<F5>', '<cmd>UndotreeToggle<cr>', description = 'Toggle Undotree'},
        {
            itemgroup = 'LSP',
            description = 'LSP Commands',
            icon = ' ',
            keymaps = {
                { '<Leader>d', vim.diagnostic.open_float, description = 'Open Diagnotic Float' },
                { '[d', vim.diagnostic.goto_prev, description = 'Goto Previous Error' },
                { ']d', vim.diagnostic.goto_next, description = 'Goto Next Error' },
                { 'gd', vim.lsp.buf.definition, description = 'Go to definition', opts = { buffer = bufnr } },
                -- { 'gi', vim.lsp.buf.implementation, description = 'Go to implementation', opts = { buffer = bufnr } },
                -- { 'gt', vim.lsp.buf.type_definition, description = 'Go to type definition', opts = { buffer = bufnr } },
                { 'gi', ':Telescope lsp_implementations<CR>', description = 'Goto Implemention' },
                { 'gr', ':Telescope lsp_references<CR>', description = 'Goto Reference' },
                { 'K', vim.lsp.buf.hover, description = 'Preview Definition' },
                { '<Leader>rn', vim.lsp.buf.rename, description = 'Rename' },
                { '<Leader>pm', ':PhpactorContextMenu<CR>', description = 'Phpactor Context Menu' },
                { '<Leader>pn', ':PhpactorClassNew<CR>', description = 'Phpactor new class' },
                { '<Leader>ra', ':RustLsp codeAction<CR>', description = 'Rust actions' },
            }
        },
        {
            itemgroup = 'Git',
            description = 'Git tools',
            icon = ' ',
            keymaps = {
                { ']h', ':Gitsigns next_hunk<CR>', description = 'Goto Next Hunk' },
                { '[h', ':Gitsigns prev_hunk<CR>', description = 'Goto Previous Hunk' },
                { 'gs', ':Gitsigns stage_hunk<CR>', description = 'Stage Hunk' },
                { 'gS', ':Gitsigns undo_stage_hunk<CR>', description = 'Unstage Hunk' },
                { 'gp', ':Gitsigns preview_hunk<CR>', description = 'Preview Hunk' },
                { 'gb', ':Gitsigns blame_line<CR>', description = 'Toggle blame line' },
            }
        },
        {
            itemgroup = 'Test...',
            description = 'Run testing tool',
            icon = '',
            keymaps = {
                { '<leader>tn', ':TestNearest<CR>', description = 'Run nearest test' },
                { '<leader>tf', ':TestFile<CR>', description = 'Run tests for file' },
                { '<leader>ts', ':TestSuite<CR>', description = 'Run entire test suite' },
                { '<leader>tl', ':TestLast<CR>', description = 'Run last test' },
                { '<leader>tv', ':TestVisit<CR>', description = 'Go to test' },
            }
        },
        {
            itemgroup = 'Search...',
            description = 'Various telescope.nvim finders',
            icon = ' ',
            keymaps = {
                -- ctrl+f from command line to search command history
                {
                    '<C-f>',
                    function()
                        local search = vim.fn.getcmdline()
                        vim.fn.setcmdline('')
                        require('telescope.builtin').command_history({ default_text = search })
                    end,
                    description = 'Search command history',
                    mode = 'c',
                },
                { '<leader>fr', h.lazy_required_fn('telescope.builtin', 'resume'), description = 'Resume last Telescope finder' },
                { '<leader>ff', h.lazy_required_fn('telescope.builtin', 'find_files'), description = 'Find files' },
                { '<leader>fF', h.lazy_required_fn('telescope.builtin', 'find_files', {no_ignore = true, prompt_title = 'All Files'}), description = 'Find all files' },
                { '<leader>b', h.lazy_required_fn('telescope.builtin', 'buffers'), description = 'Find open buffers' },
                { '<leader>fg', h.lazy_required_fn('telescope', 'extensions.live_grep_args.live_grep_args'), description = 'Find pattern' },
                { '<leader>fh', h.lazy_required_fn('telescope.builtin', 'oldfiles'), description = 'Find recent files' },
                { '<leader>st', ':TodoTelescope<CR>', description = 'Find TODOs' },
                { '<leader>fs', h.lazy_required_fn('telescope.builtin', 'lsp_document_symbols'), description = 'Find LSP Symbols' },
                { '<leader>u', h.lazy_required_fn('telescope', 'extensions.undo.undo'), description = 'Undo History' },
                { '<leader>fp', h.lazy_required_fn('telescope', 'extensions.projects.projects'), description = 'Find Projects' },
                { '<leader>fy', h.lazy_required_fn('telescope', 'extensions.neoclip.neoclip'), description = 'Find Yank / Copy / Cut' },
                { '<leader>fS', h.lazy_required_fn('telescope', 'extensions.persisted.persisted'), description = 'Find sessions' },
            },
        },
        {
            itemgroup = 'Trouble...',
            description = 'Various Trouble.nvim toggles',
            icon = ' ',
            keymaps = {
                { '<leader>xx', ':TroubleToggle<CR>', description = 'Trouble Toggle' },
                { '<leader>xw', ':TroubleToggle workspace_diagnostics<CR>', description = 'Trouble Workspace Diagnostics' },
                { '<leader>xd', ':TroubleToggle document_diagnostics<CR>', description = 'Trouble Document Diagnostics' },
                { '<leader>xq', ':TroubleToggle quickfix<CR>', description = 'Trouble Quickfix' },
                { '<leader>xl', ':TroubleToggle loclist<CR>', description = 'Trouble LocList' },
                { '<leader>xt', ':TodoTrouble<CR>', description = 'Trouble TODO' },
                { 'gR', ':TroubleToggle lsp_references<CR>', description = 'Trouble LSP References' },
            }
        },

        { '<leader>l', ':LegendaryScratchToggle<CR>', description = 'Toggle legendary.nvim scratchpad' },

        { 'w', function() require('spider').motion('w') end, mode = {'n', 'o', 'x'}, description = 'Spider-w' },
        { 'e', function() require('spider').motion('e') end, mode = {'n', 'o', 'x'}, description = 'Spider-e' },
        { 'b', function() require('spider').motion('b') end, mode = {'n', 'o', 'x'}, description = 'Spider-b' },
        { 'ge', function() require('spider').motion('ge') end, mode = {'n', 'o', 'x'}, description = 'Spider-ge' },

        { ']t' , function() require('todo-comments').jump_next() end, mode = { 'n' }, description = 'Goto next TODO' },
        { '[t' , function() require('todo-comments').jump_prev() end, mode = { 'n' }, description = 'Goto previous TODO' },

        -- The Splits
        { '<leader>ww', "<C-W>p", description = "Other window" },
        { 'leader>wd', "<C-W>c", description = "Delete window" },
        { "<leader>w-", "<C-W>s", description = "Split window below" },
        { "<leader>w|", "<C-W>v", description = "Split window right" },
        { "<leader>-", "<C-W>s", description = "Split window below" },
        { "<leader>|", "<C-W>v", description = "Split window right" },
        { "<leader>wz", "<C-W>m", description = "Zoom/Unzoom window" },

        -- Buffer stuff
        { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", description = "Prev buffer" },
        { "<S-l>", "<cmd>BufferLineCycleNext<cr>", description = "Next buffer" },
        { "[b", "<cmd>BufferLineCyclePrev<cr>", description = "Prev buffer" },
        { "]b", "<cmd>BufferLineCycleNext<cr>", description = "Next buffer" },

        -- h/j/k/l mappings, split movement with tmux integration
        { '<C-h>', "<cmd>NvimTmuxNavigateLeft<cr>", description = "Move to Left Split/Pane" },
        { '<C-j>',  "<cmd>NvimTmuxNavigateDown<cr>", description = "Move to Down Split/Pane" },
        { '<C-k>',  "<cmd>NvimTmuxNavigateLeft<cr>", description = "Move to Up Split/Pane" },
        { '<C-l>',  "<cmd>NvimTmuxNavigateLeft<cr>", description = "Move to Right Split/Pane" },
        { '<C-\\>',  "<cmd>NvimTmuxNavigateLastActive<cr>", description = "Move to Last Active Split/Pane" },
        { '<C-space>',  "<cmd>NvimTmuxNavigateNext<cr>", description = "Move to Next Split/Pane" },

        -- -- h/j/k/l mappings, split resizing
        { "<C-Up>", "<cmd>resize +2<cr>", description = "Increase window height" },
        { "<C-Down>", "<cmd>resize -2<cr>", description = "Decrease window height" },
        { "<C-Left>", "<cmd>vertical resize -2<cr>", description = "Decrease window width" },
        { "<C-Right>", "<cmd>vertical resize +2<cr>", description = "Increase window width" },

        -- spread
        {
          '<leader>so',
          ':TSJSplit',
          description = 'Split arrays/lists/etc. onto multiple lines',
        },
        {
          '<leader>si',
          ':TSJJoin',
          description = 'Join arrays/lists/etc. onto a single line',
        },
        {
            '<leader>st',
            'TSToggle',
            description = 'Toggle split/join of array/lines'
        },
    }
end

return M
