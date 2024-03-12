return {
  "someone-stole-my-name/yaml-companion.nvim",
  requires = {
    { "neovim/nvim-lspconfig" },
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim" },
  },
  config = function()
    require("telescope").load_extension("yaml_schema")
  end,
  keys = {
    { "<leader>cy", "<cmd>Telescope yaml_schema<cr>", desc = "Set yaml schema for current buffer" },
    {
      "<leader>cY",
      function()
        local schema = require("yaml-companion").get_buf_schema(0)
        if schema.result[1].name == "none" then
          return ""
        end
        return schema.result[1].name
      end,
      desc = "get yaml schema for current buffer",
    },
  },
}
