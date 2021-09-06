"let g:conjure#log#hud#enabled = v:false
let g:conjure#log#hud#width = 1.0
let g:conjure#log#hud#anchor = "SE"

let g:conjure#log#botright = v:true
let g:conjure#log#wrap = v:true

let g:conjure#eval#gsubs = {
      \ 'do-comment': ['^%(comment[%s%c]', '(do ']
      \ }

let g:conjure#highlight#enabled = v:true
