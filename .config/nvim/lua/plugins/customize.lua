return {
  -- {
  --     "akinsho/bufferline.nvim",
  --     opts = {
  --       options = {
  --         always_show_bufferline = true,
  --       },
  --     },
  --   },
  -- Better mark management
  --   "chentoast/marks.nvim",
  -- Dim other windows
  --   "sunjon/shade.nvim",
  -- All closing buffers without closing the split window.
  --   "famiu/bufdelete.nvim",
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
}
