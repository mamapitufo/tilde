" HUD at the bottom, full width
let g:conjure#log#hud#width = 1.0
let g:conjure#log#hud#anchor = "SE"

" Log window at the bottow, full width
let g:conjure#log#botright = v:true
let g:conjure#log#wrap = v:true

let g:conjure#eval#gsubs = {
      \ 'do-comment': ['^%(comment[%s%c]', '(do ']
      \ }

let g:conjure#highlight#enabled = v:true

let g:conjure#client#clojure#nrepl#eval#auto_require = v:false

" Handle these with LSP
let g:conjure#mapping#doc_word = [',K']
let g:conjure#mapping#def_word = v:false
