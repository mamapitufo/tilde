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
}
