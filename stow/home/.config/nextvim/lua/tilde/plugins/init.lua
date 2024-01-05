return {
  { -- default colorscheme
    'mcchrish/zenbones.nvim',
    dependencies = { 'rktjmp/lush.nvim' },
    priority = 1000,
    config = function()
      vim.g.zenbones_lightness = 'bright'
      vim.g.zenbones_solid_vert_split = true
      vim.g.zenbones_solid_float_border = true

      vim.o.background = 'light'
      vim.cmd [[colorscheme zenbones]]

      vim.cmd [[highlight WinSeparator guibg = None]]
      vim.cmd [[highlight clear SignColumn]]
    end,
  },

  { 'folke/lazy.nvim', version = '*' },

  { -- better defaults
    'echasnovski/mini.basics',
    version = '*',
    options = {
      options = {
        extra_ui = true,
        win_borders = 'single',
      },
      mappings = false,
      autocommands = false,
    },
    config = function(_, opts)
      require('mini.basics').setup(opts)
    end,
  },
}
