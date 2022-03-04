function! ModulePath(name)
  return stdpath("config") . "/" . a:name . ".vim"
endfunction

function! LoadModule(name)
  exec "source" ModulePath(a:name)
endfunction

