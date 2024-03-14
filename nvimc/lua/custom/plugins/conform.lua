return { -- Autoformat
  'stevearc/conform.nvim',
  keys = {
    {
      -- Customize or remove this keymap to your liking
      '<leader>bf',
      function()
        require('conform').format { async = true, lsp_fallback = true }
      end,
      mode = 'n',
      desc = '[B]uffer [F]ormat',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      -- Conform can also run multiple formatters sequentially
      python = { 'black' },
      --
      -- You can use a sub-list to tell conform to run *until* a formatter
      -- is found.
      -- javascript = { { "prettierd", "prettier" } },
    },
  },
}
