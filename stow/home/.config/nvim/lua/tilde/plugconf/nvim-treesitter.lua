require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    'clojure',
    'typescript',
    'javascript',
    'tsx',
    'json',
    'yaml',
    'html',
  },
  highlight = { enable = true },
  indent = { enable = true },
}
