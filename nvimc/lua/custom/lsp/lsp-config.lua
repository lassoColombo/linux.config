return { -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs and related tools to stdpath for neovim
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',

    -- Useful status updates for LSP.
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    { 'j-hui/fidget.nvim', opts = {} },
  },
  config = function()
    -- `:help lsp-vs-treesitter`

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = event.buf, desc = desc })
        end

        map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
        map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        map('<leader>bs', require('telescope.builtin').lsp_document_symbols, '[B]uffer [S]ymbols')
        map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
        map('<leader>cr', vim.lsp.buf.rename, '[C]ode [R]ename')
        map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
        map('<leader>cil', '<cmd>LspInfo<cr>', '[C]ode [I]nfo [L]sp')
        map('K', vim.lsp.buf.hover, 'Hover Documentation')

        map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
        map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

        -- The following two autocommands are used to highlight references of the
        -- word under cursor when your cursor rests there for a little while.
        -- See `:help CursorHold` for information about when this is executed
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    local servers = {
      lua_ls = require 'custom.lsp.configs.luals',
      jsonls = require 'custom.lsp.configs.jsonls',
      pyright = require 'custom.lsp.configs.pyright',
      ruff_lsp = require 'custom.lsp.configs.ruff',
      yamlls = require 'custom.lsp.configs.yamlls',
      helm_ls = require 'custom.lsp.configs.helmls',
      ansiblels = require 'custom.lsp.configs.ansiblels',
      dockerls = require 'custom.lsp.configs.dockerls',
      docker_compose_language_service = require 'custom.lsp.configs.dockercomposels',
      sqls = require 'custom.lsp.configs.sqlls',
      gopls = require 'custom.lsp.configs.gopls',
    }

    require('mason').setup()
    vim.keymap.set('n', '<leader>cm', '<cmd>Mason<CR>', { desc = '[C]ode [M]ason' })

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      -- lua
      'lua_ls', -- LS
      'stylua', -- formatter
      -- python
      'pyright', -- LS
      'ruff-lsp', -- LS
      'black', -- formatter
      -- yaml
      'yamlls', -- LS
      'prettier', -- formatter
      -- json
      'jsonls', -- LS
      -- 'prettier', -- formatter -- :NOTE: already included in yaml section
      -- dockerfiles
      'hadolint',
      -- helm charts
      'helm-ls',
      -- ansible
      'ansible-lint',
      -- go
      'goimports',
      'gofumpt',
      'gomodifytags',
      'impl',
      'delve',
    })
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    require('mason-lspconfig').setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          -- This handles overriding only values explicitly passed
          -- by the server configuration above. Useful when disabling
          -- certain features of an LSP (for example, turning off formatting for tsserver)
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }
  end,

  setup = {
    ruff_lsp = function()
      vim.lsp.on_attach(function(client, _)
        if client.name == 'ruff_lsp' then
          -- Disable hover in favor of Pyright
          client.server_capabilities.hoverProvider = false
        end
      end)
    end,
    gopls = function(_, opts)
      -- workaround for gopls not supporting semanticTokensProvider
      -- https://github.com/golang/go/issues/54531#issuecomment-1464982242
      vim.lsp.on_attach(function(client, _)
        if client.name == 'gopls' then
          if not client.server_capabilities.semanticTokensProvider then
            local semantic = client.config.capabilities.textDocument.semanticTokens
            client.server_capabilities.semanticTokensProvider = {
              full = true,
              legend = {
                tokenTypes = semantic.tokenTypes,
                tokenModifiers = semantic.tokenModifiers,
              },
              range = true,
            }
          end
        end
      end)
    end,
  },
}
