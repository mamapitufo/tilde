let mapleader="\<Space>"
let maplocalleader=","

nnoremap <silent> <leader>feR :source $MYVIMRC<cr>
nnoremap <silent> <leader>xdw :let _s=@/ <bar> :%s/\s\+$//e <bar> :let @/=_s <bar> :nohl <bar> :unlet _s <cr>

nnoremap <silent> <leader>tw :set list!<cr>
nnoremap <silent> <leader>tS :set spell!<cr>

au FileType gitcommit nnoremap <buffer> <localleader>c :wq<cr>
au FileType gitcommit nnoremap <buffer> <localleader>k ggdG <bar> :wq!<cr>
