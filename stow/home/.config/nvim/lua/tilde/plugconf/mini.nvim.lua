local bufremove = require('mini.bufremove')

bufremove.setup()
vim.keymap.set('n', '<leader>bq', bufremove.delete, {silent=true})
vim.keymap.set('n', '<leader>bd', bufremove.wipeout, {silent=true})

local status_ok, which_key = pcall(require, 'which-key')
if not status_ok then
  return
end

which_key.register({
  ['<leader>bq'] = 'Close buffer',
  ['<leader>bd'] = 'Close buffer removing it from jumplist',
})
