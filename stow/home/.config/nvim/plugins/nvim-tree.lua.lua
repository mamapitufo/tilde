require('nvim-tree').setup()

require('which-key').register({
  ['<leader>tt'] = { '<cmd>NvimTreeToggle<cr>', 'Toggle file browser' }
})
