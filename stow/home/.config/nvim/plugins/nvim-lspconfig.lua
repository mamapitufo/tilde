vim.fn.sign_define('LspDiagnosticsSignError', { text = ' ' })
vim.fn.sign_define('LspDiagnosticsSignWarning', { text = ' ' })
vim.fn.sign_define('LspDiagnosticsSignInformation', { text = '' })
vim.fn.sign_define('LspDiagnosticsSignHint', { text = '' })

local hoverHandler = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
local signatureHelpHandler = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local default_bindings = function(bufnr)
  local map = function(mode, mapping, command)
    local map_opts = { silent = true, noremap = true }
    vim.api.nvim_buf_set_keymap(bufnr, mode, mapping, command, map_opts)
  end

  map('n', 'gd', ':lua vim.lsp.buf.definition()<cr>')
  map('n', 'K', ':lua vim.lsp.buf.hover()<cr>')
  map('n', '[d', ':lua vim.lsp.diagnostic.goto_prev()<cr>')
  map('n', ']d', ':lua vim.lsp.diagnostic.goto_next()<cr>')

  map('n', '<leader>ld', ':lua vim.lsp.buf.declaration()<cr>')
  map('n', '<leader>lt', ':lua vim.lsp.buf.type_definition()<cr>')
  map('n', '<leader>lk', ':lua vim.lsp.buf.signature_help()<cr>')
  map('n', '<leader>ln', ':lua vim.lsp.buf.rename()<cr>')
  map('n', '<leader>=', ':lua vim.lsp.buf.formatting()<cr>')

  map('n', '<leader>le', ':lua vim.lsp.diagnostic.show_line_diagnostics()<cr>')
  map('n', '<leader>ll', ':lua vim.lsp.diagnostic.set_loclist()<cr>')

  map('n', '<leader>la', ':lua require"telescope.builtin".lsp_code_actions(require"telescope.themes".get_cursor())<cr>')
  map('n', '<leader>lw', ':lua require"telescope.builtin".lsp_workspace_diagnostics()<cr>')
  map('n', '<leader>lr', ':lua require"telescope.builtin".lsp_references()<cr>')
  map('n', '<leader>li', ':lua require"telescope.builtin".lsp_implementations()<cr>')

  map('v', '<leader>la', ':lua require"telescope.builtin".lsp_range_code_actions(require"telescope.themes".get_cursor())<cr>')

  local wk = require'which-key'
  wk.register({
    gd = 'Jump to symbol definition',
    K = 'Show documentation',
    ['[d'] = 'Go to prev diagnostic',
    [']d'] = 'Go to next diagnostic',

    ['<leader>'] = {
      ld = 'Jump to symbol declaration',
      lt = 'Jump to type def',
      lk = 'Show symbol signature',
      ln = 'Rename symbol',
      le = 'Show line diagnostics',
      lq = 'Send diagnostics to loc list',
      ['='] = 'Format current buffer',

      la = 'Find code actions',
      lw = 'Show diagnostics',
      lr = 'Find references',
      li = 'Find implementations',
    }
  }, { buffer = bufnr })

  wk.register({
    ['<leader>la'] = 'Find code actions'
  }, { mode = 'v', buffer = bufnr })
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

