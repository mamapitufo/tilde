if !AssertPlugin('conjure') | finish | endif

" HUD at the bottom, full width
let g:conjure#log#hud#width = 1.0
let g:conjure#log#hud#anchor = "SE"
let g:conjure#log#wrap = v:true

let g:conjure#highlight#enabled = v:true

let g:conjure#client#clojure#nrepl#connection#auto_repl#enable = v:false

" Handle these with LSP
let g:conjure#mapping#doc_word = [',K']
let g:conjure#mapping#def_word = v:false
