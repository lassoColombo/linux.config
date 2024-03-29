return {
  'linux-cultist/venv-selector.nvim',
  ft = 'python',
  drpendencies = {
    'neovim/nvim-lspconfig',
    'nvim-telescope/telescope.nvim',
    -- 'mfussenegger/nvim-dap-python' -- :TODO: activate when dap is configured
  },
  opts = function(_, opts)
    local custom_opts = {
      -- dap_enabled = true, -- :TODO: activate when dap is configured
      name = { 'venv', '.venv', 'env', '.env', '*_venv' },
    }
    return vim.tbl_deep_extend('force', opts, custom_opts)
  end,
  keys = {
    -- Keymap to open VenvSelector to pick a venv.
    { '<leader>cV', '<cmd>VenvSelect<cr>', desc = '[C]ode [V]env', ft = 'python' },
  },
}
