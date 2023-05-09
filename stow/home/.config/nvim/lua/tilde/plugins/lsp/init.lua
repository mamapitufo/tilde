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
      { 'folke/neodev.nvim', opts = {} },
      -- better ui for lsp-progress
      { 'j-hui/fidget.nvim', opts = {} },
      -- a few extra things for tsserver
      { 'jose-elias-alvarez/typescript.nvim' },
    },
    opts = {
      diagnostics = {
        signs = true,
        update_in_insert = false,
        virtual_text = {
          severity = vim.diagnostic.severity.ERROR,
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
        clojure_lsp = {},
        cssls = {},
        fennel_language_server = {},
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
      setup = {
        tsserver = function(_, opts)
          require('typescript').setup { server = opts }
          return true
        end,
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

      local function setup(server)
        local server_opts = vim.tbl_deep_extend('force', {
          capabilities = vim.deepcopy(capabilities),
        }, servers[server] or {})

        if opts.setup[server] then
          if opts.setup[server](server, server_opts) then
            return
          end
        end
        require('lspconfig')[server].setup(server_opts)
      end

      -- ensure servers are installed with mason
      local mason_lspconfig = require 'mason-lspconfig'
      local all_masonlsp_servers = vim.tbl_keys(require('mason-lspconfig.mappings.server').lspconfig_to_package)
      local ensure_installed = {}
      for server, server_opts in pairs(servers) do
        if server_opts then
          server_opts = server_opts == true and {} or server_opts
          if server_opts.mason == false or not vim.tbl_contains(all_masonlsp_servers, server) then
            setup(server)
          else
            ensure_installed[#ensure_installed + 1] = server
          end
        end
      end

      mason_lspconfig.setup {
        ensure_installed = ensure_installed,
      }
      mason_lspconfig.setup_handlers {
        setup,
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
        root_dir = require('null-ls.utils').root_pattern('.null-ls-root', 'package.json', '.git'),
        sources = {
          -- formatters
          null_ls.builtins.formatting.eslint_d,
          null_ls.builtins.formatting.stylua,
          -- diagnostics/linters
          null_ls.builtins.diagnostics.eslint_d,
          null_ls.builtins.diagnostics.fish,
          null_ls.builtins.diagnostics.luacheck,
          null_ls.builtins.diagnostics.stylelint,
          -- code actions
          null_ls.builtins.code_actions.eslint_d,
          require 'typescript.extensions.null-ls.code-actions',
        },
      }
    end,
  },
  {
    'MunifTanjim/prettier.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = { 'null-ls.nvim', 'neovim/nvim-lspconfig' },
    opts = {
      bin = 'prettierd',
    },
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
