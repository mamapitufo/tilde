" map Ctrl+n to :nohilight (tip #764)
nmap <silent> <C-N> :silent noh<CR> 

" bclose.vim plugin
map <Leader>w :Bclose<CR>

" scratch plugin
map <Leader>sc :Scratch<CR>
map <Leader>ss :Sscratch<CR>

" exec selected text
map <Leader>! :!sh<CR>

" CtrlP
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'

" NERDCommenter
let NERDCreateDefaultMappings=0
let NERDCommentWholeLinesInVMode=1
let NERDSpaceDelims=1
map <Leader>c <plug>NERDCommenterToggle

