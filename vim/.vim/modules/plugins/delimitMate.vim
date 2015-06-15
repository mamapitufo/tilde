" Expand <cr> to indent the line between delimiters
let g:delimitMate_expand_cr=1
" Expand <space> to insert a space around the cursor
let g:delimitMate_expand_space=1 

" Allow triple ` in markdown
au FileType markdown let b:delimitMate_nesting_quotes=['`']

