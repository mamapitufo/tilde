let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

runtime tilde-fns.vim
set shell=sh

call LoadModule('functions')
call LoadModule('options')
call LoadModule('mappings')
call LoadModule('plugins')
call LoadModule('autocmds')
call LoadModule('colours')

let localrc='~/.nvim.local.vim'
if filereadable(localrc)
  source localrc
endif
