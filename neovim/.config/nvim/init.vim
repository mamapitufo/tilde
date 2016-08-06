function! NvimDir(path)
  return '~/.config/nvim/' . a:path
endfunction

" load configuration modules
for module in split(glob(NvimDir('modules/*.vim')), '\n')
  execute 'source' module
endfor

let localrc = '~/.nvim.local.vim'
if filereadable(localrc)
  source localrc
endif

