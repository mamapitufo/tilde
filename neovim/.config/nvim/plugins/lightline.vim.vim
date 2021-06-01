function! LightlineReadonly()
  return &readonly && &filetype !=# 'help' ? 'RO' : ''
endfunction

function! LightlineFilename()
  if &ft ==# 'vim-plug' || &ft ==# 'gitcommit'
    return ''
  endif

  let l:name=winwidth(0) > 70 ? expand('%:p:h:t') . '/' . expand('%:t') : expand('%:t')
  let l:filename=expand('%:t') !=# '' ? l:name : '[No Name]'

  let l:modified=&modified ? ' ●' : ''

  return l:filename . l:modified
endfunction

function! LightlineFileInfo()
  if &ft ==# 'help' || &ft ==# 'vim-plug'
    return ''
  endif

  let l:filetype = &ft !=# '' ? &ft : '[no ft]'
  let l:components = [l:filetype]

  if &fenc !=# 'utf-8'
    call add(l:components, &fenc)
  endif
  if &ff !=# 'unix'
    call add(l:components, &ff)
  endif

  return join(l:components, ' | ')
endfunction

function! LightlineGit()
  if &ft ==# 'vim-plug'
    return ''
  endif

  let l:name=fugitive#head(8)
  if len(l:name)
    return ' ' . l:name
  else
    return ''
  endif
endfunction

function! LightlineMode()
  return &ft ==# 'help' ? '[Help]' :
        \ &ft ==# 'vim-plug' ? '[VimPlug]' :
        \ lightline#mode()
endfunction

let g:lightline={
  \ 'colorscheme': 'solarized',
  \ 'component_function': {
  \   'readonly': 'LightlineReadonly',
  \   'filename': 'LightlineFilename',
  \   'gitbranch': 'LightlineGit',
  \   'fileinfo': 'LightlineFileInfo',
  \   'mode': 'LightlineMode',
  \ },
  \ 'component': {
  \   'percent': '%3p%% (%LL)',
  \ },
  \ 'active': {
  \   'left': [['mode', 'paste'],
  \            ['gitbranch', 'readonly', 'filename']],
  \   'right': [['lineinfo'],
  \             ['percent'],
  \             ['fileinfo']]
  \ },
  \ 'inactive': {
  \   'left': [['filename']],
  \   'right': []
  \ },
  \ }
