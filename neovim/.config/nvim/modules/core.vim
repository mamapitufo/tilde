if &shell =~# 'fish$'
  set shell=sh
endif

set textwidth=79
set updatetime=350
set termguicolors
set wildmenu
set wildmode=list:longest,full

" This could be covered by ale...
autocmd FileType clojure,clojurescript,javascript,css,rust,html autocmd BufWritePre <buffer> %s/\s\+$//e
