" load configuration modules
for module in split(glob('~/.vim/modules/*.vim')), '\n')
  execute 'source' module
endfor

" optionally load a local rc file
let localrc = '~/.vimrc_local'
if filereadable(localrc)
  source localrc
endif

