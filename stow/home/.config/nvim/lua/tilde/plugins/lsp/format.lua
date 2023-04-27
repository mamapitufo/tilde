local M = {}

-- this receives the same opts as `vim.lsp.buf.format`
function M.format(opts)
  vim.lsp.buf.format {
    bufnr = opts.bufnr,
    filter = function(client)
      return client.name ~= 'tsserver'
    end,
  }
end

function M.on_attach(client, bufnr)
  -- TODO: there should be a toggle for auto-format on write
  if client.supports_method 'textDocument/formatting' then
    vim.api.nvim_create_autocmd('BufWritePre', {
      callback = function()
        M.format { bufnr = bufnr }
      end,
      buffer = bufnr,
      group = vim.api.nvim_create_augroup('LSPFormatOnSave' .. bufnr, {}),
    })
  end
end

return M
