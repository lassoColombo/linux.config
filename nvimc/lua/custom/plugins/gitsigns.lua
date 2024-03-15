-- See `:help gitsigns` to understand what the configuration keys do
return { -- Adds git related signs to the gutter, as well as utilities for managing changes
  'lewis6991/gitsigns.nvim',
  keys = {
    { '<leader>Gb', '<cmd>Gitsigns blame_line<CR>', desc = '[G]it [B]lame' },
  },
  opts = function()
    return {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    }
  end,
}
