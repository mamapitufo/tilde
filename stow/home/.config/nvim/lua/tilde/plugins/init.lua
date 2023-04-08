return {
  { 'folke/lazy.nvim', version = '*' },

  {
    'folke/which-key.nvim',                 -- Pending keymap hints
    config = function()
      require('which-key').register {
        ['<leader>'] = {
          b = { name = '+buffer' },
          d = { name = '+diagnostics' },
          f = { name = '+file' },
          g = { name = '+git' },
          gb = { name = '+blame' },
          gh = { name = '+hunks' },
          l = { name = '+LSP' },
          q = { name = '+quit' },
          s = { name = '+search' },
          t = { name = '+toggle' },
          tg = { name = '+git' },
          w = { name = '+window' },
        },
      }
          end,
  },

  'tpope/vim-dispatch',                     -- run processes
  'radenling/vim-dispatch-neovim',

  'tpope/vim-sleuth',                       -- detect tabstop and shiftwidth automatically
  'tpope/vim-eunuch',                       -- vim sugar for shell commands
  'tpope/vim-repeat',                       -- enable dot-repeat with plugin mappings
}
