let g:ale_linters = {
            \ 'css': ['prettier'],
            \ 'graphql': ['prettier'],
            \ 'html': ['prettier'],
            \ 'javascript': ['prettier'],
            \ 'json': ['prettier'],
            \ 'less': ['prettier'],
            \ 'typescript': ['prettier'],
            \}

let g:ale_fixers = {
            \ 'css': ['prettier'],
            \ 'graphql': ['prettier'],
            \ 'html': ['prettier'],
            \ 'javascript': ['prettier'],
            \ 'json': ['prettier'],
            \ 'less': ['prettier'],
            \ 'typescript': ['prettier'],
            \}

let g:ale_fix_on_save=1
let g:ale_linters_explicit=1

nnoremap <silent> <Leader>m== <Plug>(AleFix)
nnoremap <silent> <Leader>tA :if g:ale_fix_on_save \| let g:ale_fix_on_save=0 \| else \| let g:ale_fix_on_save=1 \| endif<cr>

