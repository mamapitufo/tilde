nnoremap <silent> <leader>bq :Bdelete<cr>
nnoremap <silent> <leader>bd :Bwipeout<cr>

nnoremap <silent> <leader>bQ :bufdo :Bdelete<cr>

lua << EOF
local status_ok, which_key = pcall(require, 'which-key')
if not status_ok then
  return
end

which_key.register({
  ['<leader>bq'] = 'Close buffer',
  ['<leader>bd'] = 'Close buffer removing it from jumplist',
  ['<leader>bQ'] = 'Close all buffers',
})
EOF
