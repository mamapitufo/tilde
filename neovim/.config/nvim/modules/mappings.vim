let mapleader="\<Space>"

nnoremap <silent> <leader>feR :source $MYVIMRC<cr>

function! s:trim_trailing_ws()
  %s/\s\+$//e
endfunction

nnoremap <silent> <leader>xdw :call <sid>trim_trailing_ws()<cr>

