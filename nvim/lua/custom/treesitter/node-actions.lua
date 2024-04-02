return {
  'CKolkey/ts-node-action',
  event = 'VimEnter',
  dependencies = { 'nvim-treesitter' },
  opts = function()
    vim.keymap.set('n', '<leader>cta', require('ts-node-action').node_action, { desc = '[C]ode [T]reesitter [A]ctions' })
    require('ts-node-action').setup {
      python = require 'custom.treesitter.node-actions.python',
    }
  end,
  -- config = function()
  --   vim.keymap.set('n', '<leader>cta', require('ts-node-action').node_action, { desc = '[C]ode [T]reesitter [A]ctions' })
  -- end,
  setup = {},
}
