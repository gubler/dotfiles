return {
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        always_show_bufferline = true,
      },
    },
  },
  -- Better mark management
  "chentoast/marks.nvim",
  -- Dim other windows
  "sunjon/shade.nvim",
  -- All closing buffers without closing the split window.
  "famiu/bufdelete.nvim",
  -- Properly indent on paste
  "ku1ik/vim-pasta",
  -- Clear seach highlight when moving cursor
  "romainl/vim-cool",
  -- Modify w, e, and b to use sub-words (camel case, etc.)
  "chrisgrieser/nvim-spider",
  -- highlight color
  "brenoprata10/nvim-highlight-colors",
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        position = "right",
      },
    },
  },
  {
    "catppuccin/nvim",
    opts = {
      flavor = "mocha",
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        default_file_explorer = true,
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,
        view_options = {
          show_hidden = true,
          natural_order = true,
          is_always_hidden = function(name, _)
            return name == ".." or name == ".git"
          end,
        },
        float = {
          padding = 2,
          max_width = 90,
          max_height = 0,
        },
        win_options = {
          wrap = true,
          winblend = 0,
        },
        keymaps = {
          ["<C-c>"] = false,
          ["q"] = "actions.close",
        },
      })
    end,
  },
  -- {
  --   "MeanderingProgrammer/markdown.nvim",
  --   opts = {
  --     bullet = {
  --       right_pad = 1,
  --     },
  --   },
  -- },
}
