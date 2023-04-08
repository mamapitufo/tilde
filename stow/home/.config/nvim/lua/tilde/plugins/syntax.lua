return {
  'blankname/vim-fish',
  'kmonad/kmonad-vim',
  {
    'habamax/vim-asciidoctor',
    config = function()
      vim.g.asciidoctor_fenced_languages = { 'bash', 'clojure', 'css', 'html', 'javascript', 'json', 'rust', 'sh', }
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter',      -- Highlight, edit, and navigate code
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },
  {
    'norcalli/nvim-colorizer.lua',          -- Preview hex colours in background
    opts = {
      'cljs',
      'css',
      'html',
      'javascript',
      'javascriptreact',
      'json',
      'scss',
      'typescript',
      'typescriptreact',
    },
  },
}
