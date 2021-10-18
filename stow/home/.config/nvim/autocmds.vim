" filetypes @ mamapitufo
" vim: fdm=marker

" {{{ General
" augroup togglenumbers_aug
"   autocmd!
"   autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"   autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
" augroup END
augroup lastpos_aug
  autocmd!
  autocmd BufReadPost * if line("'\"") >= 1 && line("'\"") <= line('$') && &ft !~# 'gitcommit' | exe 'normal g`"' | endif
augroup END
" }}} -------------------------------------------------------------------------
" {{{ CSS
augroup css_aug
  autocmd!
  autocmd BufNewFile,BufRead /*.rasi setfiletype css
augroup END
" }}} -------------------------------------------------------------------------
" {{{ Git
augroup git_aug
  autocmd!
  autocmd FileType gitcommit nnoremap <buffer> <localleader>c :wq<cr>
  autocmd FileType gitcommit nnoremap <buffer> <localleader>k :%d <bar> :wq!<cr>
  autocmd FileType gitcommit setlocal nonumber norelativenumber
augroup END
" }}} -------------------------------------------------------------------------
" {{{ Special buffers
augroup specialbuff_aug
  autocmd!
  autocmd FileType help,vim-plug setlocal nonumber norelativenumber | nmap <buffer> <localleader>q :q<cr>
augroup END
" }}} -------------------------------------------------------------------------
