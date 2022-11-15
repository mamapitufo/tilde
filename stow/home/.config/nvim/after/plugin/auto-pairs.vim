if !AssertPlugin('auto-pairs') | finish | endif

augroup autopairs_config
  autocmd!
  " LISPs don't pair a single quote
  autocmd Filetype lisp,scheme,clojure let b:AutoPairs = {'"': '"', '{': '}', '(': ')', '[': ']', '`': '`'}
augroup END
