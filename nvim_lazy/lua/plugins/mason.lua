return {
  "mason.nvim",
  opts = function(_, opts)
    opts.ensure_installed = opts.ensure_installed or {}
    vim.list_extend(opts.ensure_installed, { "goimports", "gofumpt", "hadolint", "markdownlint", "marksman", "black" })
  end,
}
