return {
  { 'folke/lazy.nvim', version = '*' },
  -- pending keymap hints
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function(_, opts)
      local wk = require('which-key')
      wk.setup(opts)
      wk.register {
        ['<leader>'] = {
          b = { name = '+buffer' },
          c = { name = '+code' },
          d = { name = '+diagnostics' },
          f = { name = '+file' },
          g = { name = '+git' },
          gb = { name = '+blame' },
          gh = { name = '+hunks' },
          q = { name = '+quit' },
          s = { name = '+search' },
          t = { name = '+toggle' },
          tg = { name = '+git' },
          w = { name = '+window' },
        },
      }
    end,
  },
  -- run processes
  'tpope/vim-dispatch',
  'radenling/vim-dispatch-neovim',
  -- detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
  -- vim sugar for shell commands
  'tpope/vim-eunuch',
  -- `vim.ui.* enhancements
  { 'stevearc/dressing.nvim', opts = { select = { backend = { 'builtin', 'telescope' }, } } },
  -- go fwd/back with bracket pairs
  { 'echasnovski/mini.bracketed',
    config = function(_, opts)
      require('mini.bracketed').setup(opts)
    end,
  },
}
