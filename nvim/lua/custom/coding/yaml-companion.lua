return {
  'someone-stole-my-name/yaml-companion.nvim',
  event = 'BufEnter',
  requires = {
    { 'neovim/nvim-lspconfig' },
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope.nvim' },
  },
  ft = { 'yaml' },
  config = function()
    require('telescope').load_extension 'yaml_schema'
  end,
  opts = {},
  keys = {
    { '<leader>cy', '<cmd>Telescope yaml_schema<cr>', desc = '[C]ode set [Y]aml schema' },
    -- {
    --   '<leader>cY',
    --   function()
    --     local schema = require('yaml-companion').get_buf_schema(0)
    --     if not schema or schema.result[1].name == 'none' then
    --       return ''
    --     end
    --     return schema.result[1].name
    --   end,
    --   desc = '[C]ode get [Y]aml schema',
    -- },
  },
}
