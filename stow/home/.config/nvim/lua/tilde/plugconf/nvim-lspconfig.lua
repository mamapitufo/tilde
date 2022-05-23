local hoverHandler = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
local signatureHelpHandler = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local default_bindings = function(bufnr)
  local map = function(mode, l, r, opts)
    opts = opts or {}
    opts.buffer = bufnr
    vim.keymap.set(mode, l, r, opts)
  end

  map('n', 'gd', ':lua vim.lsp.buf.definition()<cr>')
  map('n', 'K', ':lua vim.lsp.buf.hover()<cr>')

  map('n', '<leader>ld', ':lua vim.lsp.buf.declaration()<cr>')
  map('n', '<leader>lt', ':lua vim.lsp.buf.type_definition()<cr>')
  map('n', '<leader>lk', ':lua vim.lsp.buf.signature_help()<cr>')
  map('n', '<leader>ln', ':lua vim.lsp.buf.rename()<cr>')
  map('n', '<leader>=', ':lua vim.lsp.buf.formatting()<cr>')

  map('n', '<leader>la', ':lua vim.lsp.buf.code_action()<cr>')
  map('n', '<leader>lw', ':Telescope diagnostics bufnr=0<cr>')
  map('n', '<leader>lr', ':Telescope lsp_references<cr>')
  map('n', '<leader>li', ':Telescope lsp_implementations<cr>')

  map('v', '<leader>la', ':lua vim.lsp.buf.range_code_action()<cr>')

  local status_ok, which_key = pcall(require, 'which-key')
  if status_ok then
    which_key.register({
      gd = 'Jump to symbol definition',
      K = 'Show documentation',

      ['<leader>'] = {
        ld = 'Jump to symbol declaration',
        lt = 'Jump to type def',
        lk = 'Show symbol signature',
        ln = 'Rename symbol',
        ['='] = 'Format current buffer',

        la = 'Find code actions',
        lw = 'Show diagnostics',
        lr = 'Find references',
        li = 'Find implementations',
      }
    }, { buffer = bufnr })

    which_key.register({
      ['<leader>la'] = 'Find code actions'
    }, { mode = 'v', buffer = bufnr })
  end
end

local lsp = require('lspconfig')
lsp.clojure_lsp.setup({
  on_attach = function(client, bufnr)
    default_bindings(bufnr)
  end,
  capabilities = capabilities,
  handlers = {
    ['textDocument/publishDiagnostics'] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics,
      {
        severity_sort = true,
        virtual_text = false,
      }
    ),
    ['textDocument/hover'] = hoverHandler,
    ['textDocument/signatureHelp'] = signatureHelpHandler,
  },
})

lsp.tsserver.setup({
  on_attach = function(client, bufnr)
    default_bindings(bufnr)
  end,
  capabilities = capabilities,
  handlers = {
    ['textDocument/publishDiagnostics'] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics,
      {
        severity_sort = true,
        update_in_insert = true,
        virtual_text = false,
      }
    ),
    ['textDocument/hover'] = hoverHandler,
    ['textDocument/signatureHelp'] = signatureHelpHandler,
  },
})

