if not require('tilde.utils').assert_plug('prettier.nvim') then return end

require('prettier').setup({
  bin = 'prettierd',
  filetypes = {
    'css',
    'graphql',
    'html',
    'javascript',
    'javascriptreact',
    'json',
    'less',
    'scss',
    'typescript',
    'typescriptreact',
    'yaml',
  }
})
