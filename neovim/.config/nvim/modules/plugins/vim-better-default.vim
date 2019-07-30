let g:vim_better_default_persistent_undo=1

runtime! plugin/default.vim

set undodir=~/.config/nvim/undo

inoremap jk <Esc>
cnoremap jk <C-c>

iunmap <c-j>
iunmap <c-k>
iunmap <c-b>
iunmap <c-f>

cunmap <c-j>
cunmap <c-k>
cunmap <c-b>
cunmap <c-f>

nunmap <leader>q
nunmap <leader>Q

nnoremap <silent> <leader>qq :q<cr>
nnoremap <leader>qQ :qa!<cr>

set background=light
set norelativenumber
