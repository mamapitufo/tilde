let g:ale_linters = {
\   'css': ['prettier'],
\   'graphql': ['prettier'],
\   'html': ['prettier'],
\   'javascript': ['prettier'],
\   'json': ['prettier'],
\   'less': ['prettier'],
\   'rust': ['rls'],
\   'typescript': ['prettier'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'css': ['prettier'],
\   'graphql': ['prettier'],
\   'html': ['prettier'],
\   'javascript': ['prettier'],
\   'json': ['prettier'],
\   'less': ['prettier'],
\   'rust': ['rustfmt'],
\   'typescript': ['prettier'],
\}

let g:ale_fix_on_save=1
let g:ale_linters_explicit=1
let g:ale_completion_enabled=1

nnoremap <silent> <Leader>m== <Plug>(AleFix)
nnoremap <silent> <Leader>tA :if g:ale_fix_on_save \| let g:ale_fix_on_save=0 \| else \| let g:ale_fix_on_save=1 \| endif<cr>

let g:ale_rust_rls_config = {
\   'rust': {
\       'build_on_save': 1,
\       'clippy_preference': 'on',
\   }
\}

au FileType rust nnoremap <buffer> <silent> K :ALEHover<cr>
au FileType rust nnoremap <buffer> <silent> gd :ALEGoToDefinition<cr>
