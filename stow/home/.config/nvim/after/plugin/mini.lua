if not require('tilde.utils').assert_plug('mini.nvim') then return end

-- bufremove
local bufremove = require('mini.bufremove')
bufremove.setup()
vim.keymap.set('n', '<leader>bq', bufremove.delete, {silent=true})
vim.keymap.set('n', '<leader>bd', bufremove.wipeout, {silent=true})

local status_ok, which_key = pcall(require, 'which-key')
if not status_ok then
  return
end

which_key.register({
  -- comment
  gc = 'Toggle comment',
  gcc = 'Toggle comment on current line',
  -- bufremove
  ['<leader>bq'] = 'Close buffer',
  ['<leader>bd'] = 'Close buffer removing it from jumplist',
})

-- comment
require('mini.comment').setup({
  hooks = {
    pre = function()
      require('ts_context_commentstring.internal').update_commentstring()
    end
  }
})

-- surround
require('mini.surround').setup()
