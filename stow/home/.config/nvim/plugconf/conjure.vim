" HUD at the bottom, full width
let g:conjure#log#hud#width = 1.0
let g:conjure#log#hud#anchor = "SE"
let g:conjure#log#wrap = v:true

let g:conjure#highlight#enabled = v:true

let g:conjure#client#clojure#nrepl#connection#auto_repl#enable = v:false

" Handle these with LSP
let g:conjure#mapping#doc_word = [',K']
let g:conjure#mapping#def_word = v:false

nnoremap <silent> <localleader>" :ConjureShadowSelect app<cr>

lua << EOF
local status_ok, which_key = pcall(require, 'which-key')
if not status_ok then
  return
end

which_key.register({
  ['<localleader>"'] = 'CLJS REPL connect',
})
EOF
