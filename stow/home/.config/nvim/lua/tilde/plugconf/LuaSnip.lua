local luasnip = require('luasnip')

luasnip.config.set_config({
  history = true,
  updateevents = 'TextChanged,TextChangedI',
  enable_autosnippets = false,
})

require('luasnip.loaders.from_lua').load()

-- keyboard mappings
vim.keymap.set({ 'i', 's' }, '<c-k>', function()
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  end
end, { silent = true })
vim.keymap.set({ 'i', 's' }, '<c-j>', function()
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  end
end, { silent = true })
vim.keymap.set('i', '<c-l>', function()
  if luasnip.choice.active() then
    luasnip.change_choice(1)
  end
end, { silent = true })
vim.keymap.set('n', '<leader>lS', '<cmd>source ~/.config/nvim/lua/tilde/plugconf/LuaSnip.lua<cr>')

local status_ok, which_key = pcall(require, 'which-key')
if not status_ok then
  return
end

which_key.register({
  ['<leader>lS'] = 'Reload snippets'
})
