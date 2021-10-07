vim.fn.sign_define('LspDiagnosticsSignError', { text = ' ' })
vim.fn.sign_define('LspDiagnosticsSignWarning', { text = ' ' })
vim.fn.sign_define('LspDiagnosticsSignInformation', { text = '' })
vim.fn.sign_define('LspDiagnosticsSignHint', { text = '' })

local handlers = {
  ['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    { severity_sort = true,  update_in_insert = false, underline = true, virtual_text = false}
  ),
  ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'single' }),
  ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'single' }),
}

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())


local on_attach = function(client, bufnr)
  local wk = require('which-key')

  wk.register({
    gd = { '<cmd>lua vim.lsp.buf.definition()<cr>', 'Jump to symbol definition' },
    K = { '<cmd>lua vim.lsp.buf.hover()<cr>', 'Show documentation' },
    ['[d'] = { '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>', 'Go to prev diagnostic' },
    [']d'] = { '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>', 'Go to next diagnostic' },

    ['<leader>'] = {
      ld = { '<cmd>lua vim.lsp.buf.declaration()<cr>', 'Jump to symbol declaration' },
      lt = { '<cmd>lua vim.lsp.buf.type_definition()<cr>', 'Jump to type def' },
      lk = { '<cmd>lua vim.lsp.buf.signature_help()<cr>', 'Show symbol signature' },
      ln = { '<cmd>lua vim.lsp.buf.rename()<cr>', 'Rename symbol' },
      le = { '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>', 'Show line diagnostics' },
      lq = { '<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>', 'Send diagnostics to loc list' },
      ['l='] = { '<cmd>lua vim.lsp.buf.formatting()<cr>', 'Format current buffer' },

      la = { '<cmd>lua require("telescope.builtin").lsp_code_actions(require("telescope.themes").get_cursor())<cr>', 'Find code actions' },
      lw = { '<cmd>lua require("telescope.builtin").lsp_workspace_diagnostics()<cr>', 'Show diagnostics' },
      lr = { '<cmd>lua require("telescope.builtin").lsp_references()<cr>', 'Find references' },
      li = { '<cmd>lua require("telescope.builtin").lsp_implementations()<cr>', 'Find implementations' },
    }
  }, { buffer = bufnr })

  wk.register({
    ['<leader>la'] = { '<cmd>lua require("telescope.builtin").lsp_range_code_actions(require("telescope.themes").get_cursor())<cr>', 'Find code actions' }
  }, { mode = 'v', buffer = bufnr })

end

local lsp = require('lspconfig')

lsp.clojure_lsp.setup({
  on_attach = on_attach,
  handlers = handlers,
  capabilities = capabilities
})
