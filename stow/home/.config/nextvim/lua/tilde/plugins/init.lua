return {
  { -- default colorscheme
    'mcchrish/zenbones.nvim',
    dependencies = { 'rktjmp/lush.nvim' },
    priority = 1000,
    config = function()
      vim.g.zenbones_lightness = 'bright'
      vim.g.zenbones_solid_vert_split = true
      vim.g.zenbones_solid_float_border = true
      vim.g.zenbones_darken_noncurrent_window = true

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
    config = function()
      require('mini.basics').setup {
        options = {
          basic = true,
          extra_ui = true,
          win_borders = 'single',
        },
        mappings = {
          option_toggle_prefix = [[<leader>t]],
        },
        autocommands = {
          basic = true,
        },
      }

      vim.keymap.del({ 'n', 'v', 'i' }, '<C-s>')
      vim.keymap.del({ 'n', 'i' }, '<C-z>')
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
