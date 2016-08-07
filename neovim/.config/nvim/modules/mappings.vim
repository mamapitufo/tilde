" space as leader
let mapleader="\<Space>"

" <leader>* to search the current word with Ag
nnoremap <silent> <leader>* :Ag! <cword><cr>

" <leader>R to reload config
nnoremap <silent> <leader>R :source $MYVIMRC<cr>

function! s:trim_trailing_ws()
  %s/\s\+$//e
endfunction

nnoremap <silent> <leader>cw :call <sid>trim_trailing_ws()<cr>

