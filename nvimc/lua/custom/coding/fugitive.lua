return {
  'tpope/vim-fugitive',
  event = 'VimEnter',
  keys = {
    vim.keymap.set('n', '<leader>gb', '<cmd>Git blame<CR>', { desc = '[G]it [B]lame' }),
    vim.keymap.set('n', '<leader>gD', '<cmd>Git<CR>', { desc = '[G]it [D]irty' }),
    vim.keymap.set('n', '<leader>gL', '<cmd>Git log<CR>', { desc = '[G]it [L]og' }),
    vim.keymap.set('n', '<leader>gs', '<cmd>Git status<CR>', { desc = '[G]it [S]tatus' }),
  },
  config = function()
    return {}
  end,
}
