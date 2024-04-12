return {
  'ThePrimeagen/git-worktree.nvim',
  event = 'VimEnter',
  config = function()
    require('git-worktree').setup {
      change_directory_command = 'cd',
      update_on_change = true,
      update_on_change_command = 'e .',
      clearjumps_on_change = true,
      autopush = false,
    }
    require('telescope').load_extension 'git_worktree'

    -- vim.keymap.set('<leader>gws', function()
    --   require('telescope').load_extension('git_worktree').git_worktrees()
    -- end, { desc = '[G]it [W]orktree [S]witch' })
  end,
  keys = {
    {
      '<leader>gW',
      function()
        require('telescope').load_extension('git_worktree').create_git_worktree()
      end,
      mode = 'n',
      desc = '[G]it add [W]orktree',
    },

    {
      '<leader>gw',
      function()
        require('telescope').load_extension('git_worktree').git_worktrees()
      end,
      mode = 'n',
      desc = '[G]it switch [W]orktree',
    },
  },
}
