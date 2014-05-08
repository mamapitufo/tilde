" toggle search match hilight
nmap <Leader><Space> :noh<CR>

" bbye plugin
map <Leader>w :Bdelete<CR>

" scratch plugin
map <Leader>sc :Scratch<CR>
map <Leader>ss :Sscratch<CR>

" exec selected text
map <Leader>! :!sh<CR>

" CtrlP
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_user_command='ag %s -l --nocolor -g ""'

" NERDCommenter
let NERDCreateDefaultMappings=0
let NERDCommentWholeLinesInVMode=1
let NERDSpaceDelims=1
map <Leader>c <plug>NERDCommenterToggle

" NERDTree
map <Leader>tt :NERDTreeToggle<CR>
let NERDTreeWinSize=29
let NERDTreeMinimalUI=1

" rainbow_parentheses
map <Leader>9 :RainbowParenthesesToggle<CR>
map <Leader>( :RainbowParenthesesToggle<CR>
au syntax clojure RainbowParenthesesLoadRound
au syntax clojure RainbowParenthesesLoadSquare
au syntax clojure RainbowParenthesesLoadBraces

" vim-clojure-static plugin
let g:clojure_align_multiline_strings = 1

" syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_javascript_jshint_conf="~/.jshintrc"

" delimitMate
let g:delimitMate_expand_cr = 1

" YouCompleteMe
let g:ycm_filetype_whitelist = { 'javascript': 1 }
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_tags_files = 1

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep=''
let g:airline_right_sep=''

" Gundo
nnoremap <silent> <Leader>u :GundoToggle<CR>
let g:gundo_preview_bottom = 1

