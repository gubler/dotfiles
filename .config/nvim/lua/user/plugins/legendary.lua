require('legendary').setup({
        extensions = {
            smart_splits = {
                directions = { 'h', 'j', 'k', 'l' },
                mods = {
                    -- for moving cursor between windows
                    move = '<C>',
                    -- for resizing windows
                    resize = '<A>',
                    -- for swapping window buffers
                    swap = false, -- false disables creating a binding
                },
            },
        },
        keymaps = require('user.legendary.keymap').default_keymaps(),
        commands = require('user.legendary.commands').default_commands(),
        autocmds = require('user.legendary.autocmds').default_autocmds(),
        funcs = require('user.legendary.functions').default_functions(),
        -- keymaps = {
        -- map keys to a command
        -- { '<leader>p', ':Legendary<CR>', description = 'Legendary Search' },
        -- { '<leader>S', ':set spell!<CR>', description = 'Toggle spellcheck' },
        -- -- map keys to a function
        -- {
        --   '<leader>h',
        --   function()
        --     print('hello world!')
        --   end,
        --   description = 'Say hello',
        -- },
        -- -- keymaps have opts.silent = true by default, but you can override it
        -- { '<leader>s', ':SomeCommand<CR>', description = 'Non-silent keymap', opts = { silent = false } },
        -- -- create keymaps with different implementations per-mode
        -- {
        --   '<leader>c',
        --   { n = ':LinewiseCommentToggle<CR>', x = ":'<,'>BlockwiseCommentToggle<CR>" },
        --   description = 'Toggle comment',
        -- },
        -- -- create item groups to create sub-menus in the finder
        -- -- note that only keymaps, commands, and functions
        -- -- can be added to item groups
        -- {
        --   -- groups with same itemgroup will be merged
        --   itemgroup = 'short ID',
        --   description = 'A submenu of items...',
        --   icon = '',
        --   keymaps = {
        --     -- more keymaps here
        --   },
        -- },
        -- },
        -- commands = {
        -- easily create user commands
        -- {
        --   ':SayHello',
        --   function()
        --     print('hello world!')
        --   end,
        --   description = 'Say hello as a command',
        -- },
        -- {
        --   -- groups with same itemgroup will be merged
        --   itemgroup = 'short ID',
        --   -- don't need to copy the other group data because
        --   -- it will be merged with the one from the keymaps table
        --   commands = {
        --     -- more commands here
        --   },
        -- },
        -- },
        -- funcs = {
        -- Make arbitrary Lua functions that can be executed via the item finder
        -- {
        --   function()
        --     doSomeStuff()
        --   end,
        --   description = 'Do some stuff with a Lua function!',
        -- },
        -- {
        --   -- groups with same itemgroup will be merged
        --   itemgroup = 'short ID',
        --   -- don't need to copy the other group data because
        --   -- it will be merged with the one from the keymaps table
        --   funcs = {
        --     -- more funcs here
        --   },
        -- },
        -- },
        -- autocmds = {
        -- Create autocmds and augroups
        -- { 'BufWritePre', vim.lsp.buf.format, description = 'Format on save' },
        -- {
        --   name = 'MyAugroup',
        --   clear = true,
        --   -- autocmds here
        -- },
        -- },
    })
