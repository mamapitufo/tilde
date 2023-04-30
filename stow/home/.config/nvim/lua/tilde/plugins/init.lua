return {
  { 'folke/lazy.nvim', version = '*' },
  -- pending keymap hints
  {
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
  {
    'stevearc/dressing.nvim',
    opts = {
      select = {
        backend = { 'builtin', 'telescope' },
      },
    },
  },
  -- go fwd/back with bracket pairs
  {
    'echasnovski/mini.bracketed',
    config = function(_, opts)
      require('mini.bracketed').setup(opts)
    end,
  },
  -- file tree browser
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
    },
    cmd = 'Neotree',
    keys = {
      {
        '<leader>te',
        function()
          require('neo-tree.command').execute { toggle = true }
        end,
        desc = 'File explorer',
      },
      {
        '<leader>fe',
        ':Neotree reveal_file=%<cr>',
        desc = 'Reveal in file explorer',
      },
    },
    init = function()
      vim.g.neo_tree_remove_legacy_commands = 1
    end,
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
        },
      },
      window = {
        position = 'right',
        mappings = {
          ['<space>'] = 'none',
        },
      },
      default_component_configs = {
        indent = {
          with_markers = false,
          with_expanders = true,
          expander_collapsed = '',
          expander_expanded = '',
          expander_highlight = 'NeoTreeExpander',
        },
      },
    },
  },
}
