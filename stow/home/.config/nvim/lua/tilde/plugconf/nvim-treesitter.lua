require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    'clojure',
    'css',
    'fish',
    'html',
    'javascript',
    'json',
    'json5',
    'lua',
    'scss',
    'tsx',
    'typescript',
    'vim',
    'yaml',
  },
  highlight = { enable = true },
  indent = { enable = true },
}
