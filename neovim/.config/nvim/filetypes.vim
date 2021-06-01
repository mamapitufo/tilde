" filetypes @ mamapitufo
" vim: fdm=marker

" {{{ General
" augroup togglenumbers_aug
"   autocmd!
"   autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"   autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
" augroup END
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
augroup END
" }}} -------------------------------------------------------------------------
" {{{ vim-plug
augroup vimplug_aug
  autocmd!
  autocmd FileType vim-plug nmap <buffer> q :q<cr>
  autocmd FileType vim-plug setlocal nonumber norelativenumber
augroup END
" }}} -------------------------------------------------------------------------
