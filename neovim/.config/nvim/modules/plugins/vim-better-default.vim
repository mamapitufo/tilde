let g:vim_better_default_persistent_undo=1

runtime! plugin/default.vim

set undodir=~/.config/nvim/undo

inoremap jk <Esc>
cnoremap jk <C-c>

nunmap <Leader>q
nunmap <Leader>Q

nnoremap <silent> <Leader>qq :q<cr>
nnoremap <Leader>qQ :qa!<cr>

set background=light
set norelativenumber

