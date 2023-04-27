local M = {}

function M.on_attach(client, bufnr)
  local format = require('tilde.plugins.lsp.format').format
  local map = function(l, r, desc)
    vim.keymap.set('n', l, r, { buffer = bufnr, desc = desc })
  end

  map('<leader>cS', vim.lsp.buf.workspace_symbol, 'Workspace symbols')
  map('<leader>ci', vim.lsp.buf.implementation, 'Find implementations')
  map('<leader>ck', vim.lsp.buf.signature_help, 'Signature help')
  map('<leader>cn', vim.lsp.buf.rename, 'Rename symbol')
  map('<leader>cr', vim.lsp.buf.references, 'Find references')
  map('<leader>cs', vim.lsp.buf.document_symbol, 'Document symbols')
  map('K', vim.lsp.buf.hover, 'Hover')
  map('gD', vim.lsp.buf.declaration, 'Jump to symbol declaration')
  map('gd', vim.lsp.buf.definition, 'Jump to symbol definition')
  map('gt', vim.lsp.buf.type_definition, 'Jump to type definition')

  vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code actions', buffer = bufnr })

  -- Formatting might not be available on all servers
  if client.supports_method 'textDocument/formatting' then
    map('<leader>cf', function()
      format { bufnr = bufnr }
    end, 'Format current buffer')
  end
  if client.supports_method 'textDocument/rangeFormatting' then
    vim.keymap.set('v', '<leader>cf', function()
      format { bufnr = bufnr }
    end, { desc = 'Format selected range', buffer = bufnr })
  end
end

return M
