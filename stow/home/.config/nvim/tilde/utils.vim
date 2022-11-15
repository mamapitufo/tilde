function! ModulePath(name)
  return stdpath("config") . "/tilde/" . a:name . ".vim"
endfunction

function! LoadModule(name)
  exec "source" ModulePath(a:name)
endfunction

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

function! AssertPlugin(plugname)
  if (exists('g:plugs["' . a:plugname . '"]'))
    return 1
  else
    echoerr "Plugin: '" . a:plugname . "' does not exist."
    return 0
  endif
endfunction
