local cmp = require('cmp')

cmp.setup({
  formatting = {
    format = function(entry, vim_item)
      vim_item.menu = ({
        buffer = '[buff]',
        conjure = '[conj]',
        luasnip = '[snip]',
        nvim_lsp = '[lsp]',
        nvim_lua = '[lua]',
        path = '[path]',
      })[entry.source.name]
      return vim_item
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<cr>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true
    }),
  }),
  snippet = {
    expand = function(args)
      local status_ok, luasnip = pcall(require, 'luasnip')
      if not status_ok then
        return
      end
      luasnip.lsp_expand(args.body)
    end
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'conjure' },
    { name = 'luasnip' },
    { name = 'nvim_lua' },
    { name = 'path' },
    { name = 'buffer', keyword_length = 5 },
  }),
})
