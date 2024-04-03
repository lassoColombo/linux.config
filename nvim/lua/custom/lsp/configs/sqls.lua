return {
  cmd = { 'sqls', '-config', '~/.config/sqls/config.yml' },
  on_attach = function(client, bufnr)
    require('sqls').on_attach(client, bufnr) -- require sqls.nvim
    require('which-key').register {
      ['<leader>cs'] = { name = '[C]ode [S]ql', _ = 'which_key_ignore' },
      ['<leader>csl'] = { name = '[C]ode [S]ql [L]ist', _ = 'which_key_ignore' },
      ['<leader>css'] = { name = '[C]ode [S]ql [S]witch', _ = 'which_key_ignore' },
    }
    vim.keymap.set({ 'n', 'v' }, '<leader>cx', '<cmd>SqlsExecuteQuery<CR>', { desc = '[C]ode e[X]ecute' })
    vim.keymap.set('n', '<leader>csld', '<cmd>SqlsShowDatabases<CR>', { desc = '[C]ode [S]ql [L]ist [D]atabases' })
    vim.keymap.set('n', '<leader>csls', '<cmd>SqlsShowSchemas<CR>', { desc = '[C]ode [S]ql [L]ist [S]chema' })
    vim.keymap.set('n', '<leader>cslc', '<cmd>SqlsShowConnections<CR>', { desc = '[C]ode [S]ql [L]ist [C]onnections' })
    vim.keymap.set('n', '<leader>cssd', '<cmd>SqlsSwitchDatabase<CR>', { desc = '[C]ode [S]ql [S]witch [D]atabase' })
    vim.keymap.set('n', '<leader>cssc', '<cmd>SqlsSwitchConnection<CR>', { desc = '[C]ode [S]ql [S]witch [C]onnection' })
  end,
}
