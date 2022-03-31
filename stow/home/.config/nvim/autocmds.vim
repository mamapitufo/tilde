" augroup togglenumbers_aug
"   autocmd!
"   autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"   autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
" augroup END

augroup whitespace_aug
  autocmd BufWritePre * :call TrimWhitespace()
augroup end

augroup lastpos_aug
  autocmd!
  autocmd BufReadPost * if line("'\"") >= 1 && line("'\"") <= line('$') && &ft !~# 'gitcommit' | exe 'normal g`"' | endif
augroup END

augroup css_aug
  autocmd!
  autocmd BufNewFile,BufRead /*.rasi setfiletype css
  autocmd FileType scss setlocal iskeyword+=-,$
augroup END

augroup git_aug
  autocmd!
  autocmd FileType gitcommit nnoremap <buffer> <localleader>c :wq<cr>
  autocmd FileType gitcommit nnoremap <buffer> <localleader>k :%d <bar> :wq!<cr>
  autocmd FileType gitcommit setlocal nonumber norelativenumber
augroup END

augroup specialbuff_aug
  autocmd!
  autocmd FileType help,vim-plug setlocal nonumber norelativenumber | nmap <buffer> <localleader>q :q<cr>
augroup END

augroup text_aug
  autocmd!
  autocmd FileType markdown,text,asciidoctor setlocal textwidth=80 formatoptions+=a
augroup END
