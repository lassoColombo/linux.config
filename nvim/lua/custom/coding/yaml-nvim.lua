return {
  'cuducos/yaml.nvim',
  ft = { 'yaml' },
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-telescope/telescope.nvim', -- optional
  },
  opts = {},
  keys = {
    {
      '<leader>cyv',
      '<cmd>YAMLView<cr>',
      mode = 'n',
      desc = '[C]ode [Y]aml [V]view',
      ft = 'yaml',
    },
    {
      '<leader>cyy',
      '<cmd>YAMLYank<cr>',
      mode = 'n',
      desc = '[C]ode [Y]aml [Y]ank',
      ft = 'yaml',
    },
    {
      '<leader>cyY',
      '<cmd>YAMLYank<cr>',
      mode = 'n',
      desc = '[C]ode [Y]aml [Y]ank path',
      ft = 'yaml',
    },
    {
      '<leader>cyt',
      '<cmd>YAMLTelescope<cr>',
      mode = 'n',
      desc = '[C]ode [Y]aml [T]elescope',
      ft = 'yaml',
    },
  },
}
