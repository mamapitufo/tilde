return {
  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    version = false,
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',
      'dcampos/cmp-snippy',
      {
        'dcampos/nvim-snippy',
        opts = {
          mappings = {
            is = {
              ['<c-l>'] = 'expand_or_advance',
              ['<c-h>'] = 'previous',
            }
          }
        },
      },
    },
    opts = function ()
      local cmp = require 'cmp'

      return {
        completion = {
          autocomplete = false
        },
        sources = cmp.config.sources {
          { name = 'nvim_lsp' },
          { name = 'conjure' },
          { name = 'snippy' },
          { name = 'path' },
          { name = 'buffer' },
        },
        formatting = {
          format = function(entry, vim_item)
            vim_item.menu = ({
              buffer = '[buff]',
              conjure = '[conj]',
              snippy = '[snip]',
              nvim_lsp = '[lsp]',
              path = '[path]',
            })[entry.source.name]
            return vim_item
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<C-space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.close(),
          ['<cr>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
        },
        snippet = {
          expand = function(args)
            require('snippy').expand_snippet(args.body)
          end,
        },
      }
    end,
  },
  -- Highlight, edit, and navigate code
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    event = { 'BufReadPost', 'BufNewFile' },
    keys = {
      { '<c-space>', desc = 'Increment selection' },
      { '<bs>', desc = 'Decrement selection', mode = 'x' },
    },
    opts = {
      ensure_installed = {
        'clojure',
        'css',
        'fish',
        'graphql',
        'html',
        'javascript',
        'json',
        'jsonc',
        'json5',
        'lua',
        'rasi',
        'regex',
        'scss',
        'tsx',
        'typescript',
        'toml',
        'vim',
        'yaml',
      },
      auto_install = false,

      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<c-space>',
          node_incremental = '<c-space>',
          scope_incremental = '<c-s>',
          node_decremental = '<bs>',
        },
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            [']m'] = '@function.outer',
            [']]'] = '@class.outer',
          },
          goto_next_end = {
            [']M'] = '@function.outer',
            [']['] = '@class.outer',
          },
          goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[['] = '@class.outer',
          },
          goto_previous_end = {
            ['[M'] = '@function.outer',
            ['[]'] = '@class.outer',
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>a'] = '@parameter.inner',
          },
          swap_previous = {
            ['<leader>A'] = '@parameter.inner',
          },
        },
      },
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)

      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },
  -- auto insert closing parens, brackets, quotes, etc.
  -- XXX disable pairing for `'` when editing LISPs
  {
    'echasnovski/mini.pairs',
    event = 'VeryLazy',
    config = function(_, opts)
      require('mini.pairs').setup(opts)
    end,
  },
  -- comments
  { 'JoosepAlviste/nvim-ts-context-commentstring', lazy = true },
  {
    'echasnovski/mini.comment',
    event = 'VeryLazy',
    opts = {
      hooks = {
        pre = function()
          require('ts_context_commentstring.internal').update_commentstring({})
        end,
      },
    },
    config = function(_, opts)
      require('mini.comment').setup(opts)
    end,
  },
  -- auto-close html, jsx, etc. tags
  { 'windwp/nvim-ts-autotag', opts = {} },
}
