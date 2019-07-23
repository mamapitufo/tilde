let g:vim_better_default_persistent_undo=1

runtime! plugin/default.vim

set undodir=~/.config/nvim/undo

inoremap jk <Esc>
cnoremap jk <C-c>

nunmap <leader>q
nunmap <leader>Q

nnoremap <silent> <leader>qq :q<cr>
nnoremap <leader>qQ :qa!<cr>

set background=light
set norelativenumber

