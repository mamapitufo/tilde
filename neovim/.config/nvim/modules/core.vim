if &shell =~# 'fish$'
  set shell=sh
endif

" Default indent, vim-sleuth should handle it for most cases
set tabstop=2
set shiftwidth=2
set expandtab

set textwidth=79

set number
set splitbelow
set splitright
set completeopt-=preview
set updatetime=350

" this could be a bit safer, "only for .txt on Y directory..."
set modeline

