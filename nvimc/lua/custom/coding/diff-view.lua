return {
  'sindrets/diffview.nvim',
  event = 'VimEnter',
  opts = {
    vim.keymap.set('n', '<leader>gd', '<cmd>DiffViewOpen<cr>', { desc = '[G]it [D]iff' }),
    vim.keymap.set('n', '<leader>gh', '<cmd>DiffViewFileHistory<cr>', { desc = '[G]it [H]istory' }),
  },
}
