return {
  'akinsho/bufferline.nvim',
  dependencies = 'kyazdani42/nvim-web-devicons',
  opts = function()
    vim.keymap.set('n', 'L', '<cmd>BufferLineCycleNext<CR>', { desc = 'Next buffer' })
    vim.keymap.set('n', 'H', '<cmd>BufferLineCyclePrev<CR>', { desc = 'Previous buffer' })
  end,
}
