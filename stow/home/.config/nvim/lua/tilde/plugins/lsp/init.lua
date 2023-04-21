return {
  -- lsp configuration and plugins
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      -- better lua when in neovim
      {
        'folke/neodev.nvim',
        config = function()
          require('neodev').setup {
            override = function(_, library)
              library.enabled = true
              library.plugins = true
            end,
          }
        end,
      },
      -- better ui for lsp-progress
      { 'j-hui/fidget.nvim', opts = {} },
    },
    opts = {
      diagnostics = {
        signs = true,
        update_in_insert = false,
        virtual_text = {
          severity = vim.diagnostic.severity.WARNING,
          source = 'if_many',
          spacing = 6,
          signs = false,
        },
        float = {
          severity_sort = true,
          source = 'if_many',
          border = 'rounded',
          header = { '  Line diagnostics', 'DiagnosticWarning' },
          prefix = function(diagnostic)
            local diag_to_format = {
              [vim.diagnostic.severity.ERROR] = { 'Error', 'DiagnosticError' },
              [vim.diagnostic.severity.WARN] = { 'Warning', 'DiagnosticWarning' },
              [vim.diagnostic.severity.INFO] = { 'Info', 'DiagnosticInfo' },
              [vim.diagnostic.severity.HINT] = { 'Hint', 'DiagnosticHint' },
            }
            local res = diag_to_format[diagnostic.severity]
            return string.format('(%s) ', res[1]), res[2]
          end,
        },
        severity_sort = true,
      },
      servers = {
        -- clojure_lsp = {},
        cssls = {},
        html = {},
        jsonls = {},
        lua_ls = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          },
        },
        tsserver = {},
      },
    },
    config = function(_, opts)
      -- use rounded borders on all windows
      local open_floating_preview_ = vim.lsp.util.open_floating_preview
      function vim.lsp.util.open_floating_preview(contents, syntax, o, ...)
        o = o or {}
        o.border = o.border or 'rounded'
        return open_floating_preview_(contents, syntax, o, ...)
      end

      -- formatting and keymaps
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local buffer = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          require('tilde.plugins.lsp.format').on_attach(client, buffer)
          require('tilde.plugins.lsp.keymaps').on_attach(client, buffer)
        end,
      })

      -- diagnostics
      vim.diagnostic.config(opts.diagnostics)

      local servers = opts.servers
      local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

      -- TODO: copy alternative way of initialising servers (from LazyVim) to
      -- deal with typescript.nvim

      -- ensure servers are installed with mason
      local mason_lspconfig = require 'mason-lspconfig'
      local ensure_installed = vim.tbl_keys(servers)
      mason_lspconfig.setup {
        ensure_installed = ensure_installed,
      }
      mason_lspconfig.setup_handlers {
        function(server_name)
          require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            -- TODO: is this necessary? should be handled by the autocmd
            -- on_attach = on_attach,
            settings = servers[server_name],
          }
        end,
      }

      -- global keymaps
      vim.keymap.set('n', '<leader>c?', ':LspInfo<cr>', { desc = 'LSP status' })

      -- vim.lsp.set_log_level('debug')
    end,
  },

  -- formatters, linters
  {
    'jose-elias-alvarez/null-ls.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = { 'mason.nvim' },
    opts = function()
      local null_ls = require 'null-ls'
      return {
        root_dir = require('null-ls.utils').root_pattern('.null-ls-root', 'Makefile', '.git'),
        sources = {
          -- formatters
          null_ls.builtins.formatting.prettierd.with {
            condition = function(utils)
              -- FIXME: check if there is a `prettier` key in package.json?
              return utils.root_has_file_matches '.prettierrc.*'
            end,
          },
          null_ls.builtins.formatting.eslint_d.with {
            condition = function(utils)
              -- FIXME: check if there is a `eslintConfig` key in package.json?
              return utils.root_has_file_matches '.eslintrc.*'
            end,
          },
          null_ls.builtins.formatting.stylua,
          -- diagnostics/linters
          null_ls.builtins.diagnostics.eslint_d,
          null_ls.builtins.diagnostics.fish,
          null_ls.builtins.diagnostics.luacheck,
          null_ls.builtins.diagnostics.stylelint,
          null_ls.builtins.diagnostics.tidy,
          -- code actions
          null_ls.builtins.code_actions.eslint_d,
          -- TODO: install setup typescript.nvim
          -- typescript_code_actions,
        },
      }
    end,
  },

  -- install LSP servers, linters, formatters, tools...
  {
    'williamboman/mason.nvim',
    cmd = 'Mason',
    keys = { { '<leader>cm', ':Mason<cr>', desc = 'Mason (manage tooling)' } },
    opts = {
      ensure_installed = {
        'eslint_d',
        'prettierd',
        'stylua',
        'luacheck',
        'stylelint',
      },
    },
  },
}
