function! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s!\s\+$!!e
  call winrestview(l:save)
endfunction

function! HighlightTrailingWhitespace()
  highlight TrailingWhitespace ctermbg=red guibg=#a8334c
  match TrailingWhitespace /\s\+$/
endfunction

function! ToggleBackground()
  let &background = (&background == 'dark' ? 'light' : 'dark')
endfunction
