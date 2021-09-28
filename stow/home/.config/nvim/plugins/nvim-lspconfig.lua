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
  local opts = { noremap = true, silent = true }
  local buf_set_keymap = vim.api.nvim_buf_set_keymap

  buf_set_keymap(bufnr, 'n', 'gd', ':lua vim.lsp.buf.definition()<cr>', opts)
  buf_set_keymap(bufnr, 'n', 'K', ':lua vim.lsp.buf.hover()<cr>', opts)
  buf_set_keymap(bufnr, 'n', '<leader>ld', ':lua vim.lsp.buf.declaration()<cr>', opts)
  buf_set_keymap(bufnr, 'n', '<leader>lt', ':lua vim.lsp.buf.type_definition()<cr>', opts)
  buf_set_keymap(bufnr, 'n', '<leader>lh', ':lua vim.lsp.buf.signature_help()<cr>', opts)
  buf_set_keymap(bufnr, 'n', '<leader>ln', ':lua vim.lsp.buf.rename()<cr>', opts)
  buf_set_keymap(bufnr, 'n', '<leader>le', ':lua vim.lsp.diagnostic.show_line_diagnostics()<cr>', opts)
  buf_set_keymap(bufnr, 'n', '<leader>lq', ':lua vim.lsp.diagnostic.set_loclist()<cr>', opts)
  buf_set_keymap(bufnr, 'n', '[d', ':lua vim.lsp.diagnostic.goto_prev()<cr>', opts)
  buf_set_keymap(bufnr, 'n', ']d', ':lua vim.lsp.diagnostic.goto_next()<cr>', opts)
  buf_set_keymap(bufnr, 'n', '<leader>lf', ':lua vim.lsp.buf.formatting()<cr>', opts)

  buf_set_keymap(bufnr, 'n', '<leader>la', ':lua require("telescope.builtin").lsp_code_actions(require("telescope.themes").get_cursor())<cr>', opts)
  buf_set_keymap(bufnr, 'v', '<leader>la', ':lua require("telescope.builtin").lsp_range_code_actions(require("telescope.themes").get_cursor())<cr>', opts)
  buf_set_keymap(bufnr, 'n', '<leader>lw', ':lua require("telescope.builtin").lsp_workspace_diagnostics()<cr>', opts)
  buf_set_keymap(bufnr, 'n', '<leader>lr', ':lua require("telescope.builtin").lsp_references()<cr>', opts)
  buf_set_keymap(bufnr, 'n', '<leader>li', ':lua require("telescope.builtin").lsp_implementations()<cr>', opts)
end

local lsp = require('lspconfig')

lsp.clojure_lsp.setup({
  on_attach = on_attach,
  handlers = handlers,
  capabilities = capabilities
})
