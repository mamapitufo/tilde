if &shell =~# 'fish$'
  set shell=sh
endif

set textwidth=79
set updatetime=350

autocmd FileType clojure,clojurescript,javascript,css,rust,html autocmd BufWritePre <buffer> %s/\s\+$//e
