require('nvim-tree').setup()

vim.keymap.set('n', '<leader>tt', ':NvimTreeToggle<cr>', {})

local status_ok, which_key = pcall(require, 'which-key')
if not status_ok then
  return
end

which_key.register({
  ['<leader>tt'] = 'Toggle file browser'
})
