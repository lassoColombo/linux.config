return {
  'nvimtools/none-ls.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {},
  config = function()
    local null_ls = require 'null-ls'
    local sources = {
      -- null_ls.builtins.code_actions.refactoring,
      -- null_ls.builtins.formatting.isort,
      null_ls.builtins.diagnostics.pylint,
    }
    null_ls.setup { sources = sources }
  end,
}
