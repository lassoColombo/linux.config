return {
  on_attach = function(client, bufnr)
    require('sqls').on_attach(client, bufnr) -- require sqls.nvim
  end,
  settings = {
    sqls = {
      connections = {
        {
          alias = 'traho',
          driver = 'mysql',
          proto = 'tcp',
          user = 'traho',
          passwd = 'Y4WXMK!ezsPX',
          host = 'mysql.elmec.ad',
          port = 3306,
          dbName = 'traho',
        },
      },
    },
  },
}
