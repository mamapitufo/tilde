let mapleader="\<Space>"

nnoremap <silent> <leader>feR :source $MYVIMRC<cr>
nnoremap <silent> <leader>xdw :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <cr>

nnoremap <silent> <leader>tw :set list!<cr>
nnoremap <silent> <leader>tS :set spell!<cr>
