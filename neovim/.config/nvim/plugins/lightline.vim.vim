function!LightlineReadonly()
  return &readonly && &filetype !=# 'help' ? 'RO' : ''
endfunction

function LightlineFilename()
  let l:name=winwidth(0) > 70 ? expand('%:p:h:t') . '/' . expand('%:t') : expand('%:t')
  let filename=expand('%:t') !=# '' ? l:name : '[No Name]'

  let modified=&modified ? ' ●' : ''

  return filename . modified
endfunction

function LightlineFileformat()
  let l:encoding=&fileencoding !=# '' ? ' (' . &fileencoding . ')' : ''
  let l:format=&fileformat !=# '' ? &fileformat : ''

  return l:format . l:encoding
endfunction

function LightlineGit()
  let l:name=gitbranch#name()
  if len(l:name)
    return ' ' . l:name
  else
    return ''
  endif
endfunction

let g:lightline={
  \ 'colorscheme': 'solarized',
  \ 'component_function': {
  \   'readonly': 'LightlineReadonly',
  \   'filename': 'LightlineFilename',
  \   'fileformat': 'LightlineFileformat',
  \   'gitbranch': 'LightlineGit',
  \ },
  \ 'component': {
  \   'percent': '%3p%% (%LL)',
  \ },
  \ 'active': {
  \   'left': [['mode', 'paste'],
  \            ['readonly', 'filename'],
  \            ['gitbranch']],
  \   'right': [['lineinfo'],
  \             ['percent'],
  \             ['filetype', 'fileformat']]
  \ },
  \ 'inactive': {
  \   'left': [['filename']],
  \   'right': []
  \ },
  \ }
