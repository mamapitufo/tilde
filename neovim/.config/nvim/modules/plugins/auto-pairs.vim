function! <sid>lisp_autopairs()
  let b:AutoPairs=copy(g:AutoPairs)
  unlet b:AutoPairs["'"]
endfunction

autocmd FileType clojure call s:lisp_autopairs()
