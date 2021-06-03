augroup autopairs_config
  autocmd!
  " vim-sexp will handle this for LISPs
  autocmd Filetype lisp,scheme,clojure let b:AutoPairs = {}
augroup END
