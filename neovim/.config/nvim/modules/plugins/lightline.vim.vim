set noshowmode

let g:lightline = {
    \ 'colorscheme': 'solarized',
    \ 'component_function': {
    \   'readonly': 'LightlineReadonly',
    \   'filename': 'LightlineFilename',
    \   'filetype': 'LightlineFiletype',
    \   'fileformat': 'LightlineFileformat',
    \ },
    \ 'active': {
    \   'left': [['mode', 'paste'],
    \            ['readonly', 'filename']],
    \   'right': [['lineinfo'],
    \             ['percent'],
    \             ['filetype', 'fileformat']]
    \ },
    \ 'inactive': {
    \   'left': [['filename']],
    \   'right': []
    \ }
    \ }

function! LightlineReadonly()
  return &readonly && &filetype !=# 'help' ? 'RO' : ''
endfunction

function LightlineFilename()
  let l:name = winwidth(0) > 70 ? expand('%:p:h:t') . '/' . expand('%:t') : expand('%:t')
  let filename = expand('%:t') !=# '' ? l:name : '[No Name]'

  let modified = &modified ? ' +' : ''

  return filename . modified
endfunction

function LightlineFiletype()
  return winwidth(0) > 70 && &filetype !=# '' ? &filetype : ''
endfunction

function LightlineFileformat()
  let l:encoding = &fileencoding !=# '' ? ' (' . &fileencoding . ')' : ''
  let l:format = &fileformat !=# '' ? &fileformat : ''

  return l:format . l:encoding
endfunction
