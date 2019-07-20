let g:prettier#autoformat=0
autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.css,*.less,*.scss,*.html PrettierAsync

let g:prettier#config#semi='false'
let g:prettier#config#bracket_spacing='false'
let g:prettier#config#jsx_bracket_same_line='true'
let g:prettier#config#trailing_comma='all'
let g:prettier#config#prose_wrap='preserve'

nnoremap <silent> <leader>m== <Plug>(Prettier)

