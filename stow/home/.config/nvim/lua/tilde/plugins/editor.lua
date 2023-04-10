return {
  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    version = false,
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',
      'dcampos/nvim-snippy',
      'dcampos/cmp-snippy',
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
}
