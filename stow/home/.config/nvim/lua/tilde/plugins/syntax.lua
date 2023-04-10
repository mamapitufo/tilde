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
    'norcalli/nvim-colorizer.lua',          -- Preview hex colours in background
    event = 'VeryLazy',
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
    config = function(_, opts)
      require('colorizer').setup(opts)

      vim.keymap.set('n', '<leader>tc', '<cmd>ColorizerToggle<cr>', { desc = 'Colourizer' })
    end,
  },
}
