return {
  { 'numToStr/Comment.nvim', opts = {} },
  'JoosepAlviste/nvim-ts-context-commentstring',
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
}
