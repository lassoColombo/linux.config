return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostics = {
      underline = true,
      update_in_insert = false,
      --virtual_text = { spacing = 4, prefix = "●" },
      virtual_text = false,
      severity_sort = true,
    },
  },
}
