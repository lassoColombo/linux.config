return {
  -- integrations with git
  -- See `:help gitsigns` to understand what the configuration keys do
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    event = 'BufEnter',
    keys = {},
    opts = function()
      return {
        signs = {
          add = { text = vim.g.git_add_symbol },
          change = { text = vim.g.git_change_symbol },
          delete = { text = vim.g.git_delete_symbol },
          topdelete = { text = vim.g.git_todelete_symbol },
          changedelete = { text = vim.g.git_changedelete_symbol },
        },
      }
    end,
  },
}
