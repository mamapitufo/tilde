require'nvim-tree'.setup {}

vim.api.nvim_set_keymap('n', '<leader>tt', ':NvimTreeToggle<cr>', { silent = true, noremap = true })
require'which-key'.register {
  ['<leader>tt'] = 'Toggle file browser'
}
