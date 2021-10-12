local cmp = require('cmp')

cmp.setup({
  formatting = {
    format = function(entry, vim_item)
      vim_item.menu = ({
        buffer = '[buff]',
        conjure = '[conj]',
        nvim_lsp = '[lsp]',
        nvim_lua = '[lua]',
        path = '[path]',
      })[entry.source.name]
      return vim_item
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<cr>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true
    }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'conjure' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'nvim_lua' },
  },
})
