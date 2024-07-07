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
          option_toggle_prefix = '<leader>t',
        },
        autocommands = {
          basic = true,
        },
      }

      vim.keymap.del({ 'n', 'i', 'x' }, '<C-s>')
    end,
  },

  { -- keymap hints
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function(_, opts)
      local wk = require 'which-key'
      wk.setup(opts)
      wk.register {
        ['<leader>'] = {
          b = { name = '+buffer' },
          c = { name = '+code' },
          d = { name = '+diagnostics' },
          f = { name = '+file' },
          g = { name = '+git' },
          gh = { name = '+hunks' },
          q = { name = '+quit' },
          s = { name = '+search' },
          t = { name = '+toggle' },
          w = { name = '+window' },
        },
      }
    end,
  },

  { -- detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',
    event = 'VeryLazy',
  },

  { -- vim sugar for shell commands
    'tpope/vim-eunuch',
    cmd = { 'Remove', 'Delete', 'Move', 'Chmod', 'Mkdir', 'SudoWrite', 'SudoEdit' },
  },

  { -- go fwd/back with bracket pairs
    'echasnovski/mini.bracketed',
    event = 'VeryLazy',
    config = function(_, opts)
      require('mini.bracketed').setup(opts)
    end,
  },

  { -- close buffer without changing layout
    'echasnovski/mini.bufremove',
    keys = {
      {
        '<leader>bd',
        function()
          require('mini.bufremove').delete(0, false)
        end,
        desc = 'Delete buffer',
      },
      {
        '<leader>bD',
        function()
          require('mini.bufremove').delete(0, true)
        end,
        desc = 'Delete buffer',
      },
    },
    config = function(_, opts)
      require('mini.bufremove').setup(opts)
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
