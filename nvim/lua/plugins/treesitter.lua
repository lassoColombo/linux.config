return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      vim.list_extend(opts.ensure_installed, {
        "go",
        "gomod",
        "gowork",
        "gosum",
        "ninja",
        "python",
        "rst",
        "toml",
        "dockerfile",
        "json",
        "json5",
        "jsonc",
        "markdown",
        "markdown_inline",
        "yaml",
      })
    end
  end,
}
