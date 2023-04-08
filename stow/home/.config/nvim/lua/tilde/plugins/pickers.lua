return {
  {
    'nvim-telescope/telescope.nvim',        -- fuzzy finder (files, lsp, etc)
    version = '*',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',   -- fuzzy finder algorithm
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  {
    'hrsh7th/nvim-cmp',                     -- Autocompletion
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',
      'dcampos/nvim-snippy',
      'dcampos/cmp-snippy',
    },
  },
}
