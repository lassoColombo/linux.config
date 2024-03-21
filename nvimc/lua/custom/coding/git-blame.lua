return {
  'FabijanZulj/blame.nvim',
  keys = {
    vim.keymap.set('n', '<leader>gb', '<cmd>ToggleBlame<CR>', { desc = '[G]it [B]lame toggle' }),
  },

  opts = {
    date_format = '%Y/%m/%d %H:%M', -- string - Pattern for the date (default: "%Y/%m/%d %H:%M")
    virtual_style = 'right_align', -- "right_align" or "float" - Float moves the virtual text close to the content of the file. (default : "right_align")
    merge_consecutive = false, -- boolean - Merge consecutive blames that are from the same commit
    commit_detail_view = 'tab', -- string - "tab"|"split"|"vsplit"|"current" - Open commit details in a new tab, split, vsplit or current buffer
  },
}
