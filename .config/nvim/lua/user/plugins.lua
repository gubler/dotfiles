local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

require('packer').reset()
require('packer').init({
        compile_path = vim.fn.stdpath('data')..'/site/plugin/packer_compiled.lua',
        display = {
            open_fn = function()
                return require('packer.util').float({ border = 'solid' })
            end,
        },
    })

local use = require('packer').use

-- Packer can manage itself.
use('wbthomason/packer.nvim')

-- catppuccin Theme.
use({
        'catppuccin/nvim',
        as = 'catppuccin',
        config = function()
            require('user/plugins/catppuccin')
        end
    })

-- Commenting support.
use('tpope/vim-commentary')

-- Add, change, and delete surrounding text.
use('tpope/vim-surround')

-- Useful commands like :Rename and :SudoWrite.
use('tpope/vim-eunuch')

-- Pairs of handy bracket mappings, like [b and ]b.
use('tpope/vim-unimpaired')

-- Indent autodetection with editorconfig support.
use('tpope/vim-sleuth')

-- Allow plugins to enable repeating of commands.
use('tpope/vim-repeat')

-- Add more languages.
use('sheerun/vim-polyglot')

-- Add Twig language
use('gubler/vim-twig')

-- Dim other windows
use('sunjon/shade.nvim')

-- Jump to the last location when opening a file.
use('farmergreg/vim-lastplace')

-- Enable * searching with visually selected text.
use('nelstrom/vim-visual-star-search')

-- Automatically create parent dirs when saving.
use('jessarcher/vim-heritage')

-- Text objects for HTML attributes.
use({
        'whatyouhide/vim-textobj-xmlattr',
        requires = 'kana/vim-textobj-user',
    })

-- Clear seach highlight when moving cursor
use('romainl/vim-cool')

-- Automatically set the working directory to the project root.
use({
        'airblade/vim-rooter',
        setup = function()
            -- Instead of this running every time we open a file, we'll just run it once when Vim starts.
            vim.g.rooter_manual_only = 1
        end,
        config = function()
            vim.cmd('Rooter')
        end,
    })

-- Automatically add closing brackets, quotes, etc.
use({
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup()
            require("nvim-autopairs").remove_rule("'")
        end,
    })

-- Add smooth scrolling to avoid jarring jumps
use({
        'karb94/neoscroll.nvim',
        config = function()
            require('neoscroll').setup()
        end,
    })

-- All closing buffers without closing the split window.
use({
        'famiu/bufdelete.nvim',
    })

-- Split arrays and methods onto multiple lines, or join them back up.
use({
        'Wansmer/treesj',
        requires = { 'nvim-treesitter' },
        config = function()
            require('treesj').setup({
                    use_default_maps = false,
                })
        end,
    })

-- Automatically fix indentation when pasting code.
use({
        'sickill/vim-pasta',
        config = function()
            vim.g.pasta_disabled_filetypes = { 'fugitive' }
        end,
    })
use({ 'dhruvasagar/vim-zoom' })
-- Fuzzy finder
use({
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'kyazdani42/nvim-web-devicons',
            'nvim-telescope/telescope-live-grep-args.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
            'debugloop/telescope-undo.nvim',
            'ahmedkhalf/project.nvim',
        },
        config = function()
            require('user/plugins/telescope')
        end,
    })

-- Leap
use({
        'ggandor/leap.nvim',
        requires = 'tpope/vim-repeat',
        config = function()
            require('leap').add_default_mappings()
        end,
    })

use({
        'ggandor/flit.nvim',
        requires = {
            'ggandor/leap.nvim',
            'tpope/vim-repeat'
        },
        config = function()
            require('flit').setup{}
        end,
    })

-- File tree sidebar
use({
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('user/plugins/nvim-tree')
        end,
    })

-- A Status line.
use({
        'nvim-lualine/lualine.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('user/plugins/lualine')
        end,
    })

-- Display buffers as tabs.
use({
        'akinsho/bufferline.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        after = 'catppuccin',
        config = function()
            require('user/plugins/bufferline')
        end,
    })

-- Display indentation lines.
use({
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('user/plugins/indent-blankline')
        end,
    })

-- Add a dashboard.
use({
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('user/plugins/dashboard-nvim')
        end
    })

-- Git integration.
use({
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end,
    })

-- Git commands.
use({
        'tpope/vim-fugitive',
        requires = 'tpope/vim-rhubarb',
    })

-- Git commands
use({
        "NeogitOrg/neogit",
        requires = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            require('neogit').setup()
        end,
    })

--- Floating terminal.
use({
        'voldikss/vim-floaterm',
        config = function()
            vim.g.floaterm_width = 0.8
            vim.g.floaterm_height = 0.8
            vim.cmd([[
                highlight link Floaterm CursorLine
                highlight link FloatermBorder CursorLineBg
            ]])
        end
    })

-- Improved syntax highlighting
use({
        'nvim-treesitter/nvim-treesitter',
        run = function()
            require('nvim-treesitter.install').update({ with_sync = true })
        end,
        requires = {
            'JoosepAlviste/nvim-ts-context-commentstring',
            'nvim-treesitter/nvim-treesitter-textobjects',
            'HiPhish/rainbow-delimiters.nvim',
        },
        config = function()
            require('user/plugins/treesitter')
        end,
    })

-- Language Server Protocol.
use({
        'neovim/nvim-lspconfig',
        requires = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'b0o/schemastore.nvim',
            'jose-elias-alvarez/null-ls.nvim',
            'jayp0521/mason-null-ls.nvim',
            'neovim/nvim-lspconfig',
            'mrcjkb/rustaceanvim',
        },
        config = function()
            require('user/plugins/lspconfig')
        end,
    })

-- Completion
use({
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'onsails/lspkind-nvim',
        },
        config = function()
            require('user/plugins/cmp')
        end,
    })

-- PHP Refactoring Tools
use({
        'phpactor/phpactor',
        ft = 'php',
        run = 'composer install --no-dev --optimize-autoloader',
    })

-- -- Project Configuration.
use({
        'tpope/vim-projectionist',
        requires = 'tpope/vim-dispatch',
        config = function()
            require('user/plugins/projectionist')
        end,
    })

-- Testing helper
use({
        'vim-test/vim-test',
        config = function()
            require('user/plugins/vim-test')
        end,
    })

use {
    'sudormrfbin/cheatsheet.nvim',
    requires = {
        {'nvim-telescope/telescope.nvim'},
        {'nvim-lua/popup.nvim'},
        {'nvim-lua/plenary.nvim'},
    }
}

use({
        'simrat39/symbols-outline.nvim',
        config = function()
            require('user/plugins/symbols-outline')
        end,
    })
-- use({
--         "max397574/better-escape.nvim",
--         config = function()
--             require("better_escape").setup({
--                     mapping = {'jj'},
--                     clear_empty_lines = true,
--                 })
--         end,
--     })

use({
        'alexghergh/nvim-tmux-navigation',
        config = function ()
            local nvim_tmux_nav = require('nvim-tmux-navigation')

            nvim_tmux_nav.setup {
                disable_when_zoomed = true -- defaults to false
            }
        end
    })

use({ 'mrjones2014/smart-splits.nvim', run = './kitty/install-kittens.bash' })

use({
        'mrjones2014/legendary.nvim',
        requires = {
            'kkharji/sqlite.lua',
            'stevearc/dressing.nvim'
        },
        config = function()
            require('user/plugins/dressing')
            require('user/plugins/legendary')
        end
    })

use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
        require("todo-comments").setup {
        }
    end
}
use {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
        require("trouble").setup {}
    end
}

-- Modify w, e, and b to use sub-words (camel case, etc.)
use({'chrisgrieser/nvim-spider'})

-- Add Undotree
use({
    'mbbill/undotree',
    config = function()
        require('user/plugins/undotree')
    end
})

use {
    "AckslD/nvim-neoclip.lua",
    requires = {
        {'kkharji/sqlite.lua', module = 'sqlite'},
        {'nvim-telescope/telescope.nvim'},
    },
    config = function()
        require('user/plugins/neoclip')
    end,
}
-- Session persistence
use({
        "olimorris/persisted.nvim",
        config = function()
            require("persisted").setup()
        end,
    })

-- Nicer UI
use({
        "folke/noice.nvim",
        config = function()
            require("noice").setup({
                    -- add any options here
                })
        end,
        requires = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    })
-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all plugins
if packer_bootstrap then
    require('packer').sync()
end

vim.cmd([[
    augroup packer_user_config
      autocmd!
      autocmd BufWritePost plugins.lua source <afile>
    augroup end
  ]])
