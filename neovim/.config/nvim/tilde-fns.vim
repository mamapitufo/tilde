function! ModulePath(name)
  return stdpath("config") . "/" . a:name . ".vim"
endfunction

function! LoadModule(name)
  exec "source" ModulePath(a:name)
endfunction

if (!exists('*SourceConfig'))
  function SourceConfig() abort
    for f in split(glob(stdpath("config") . "/autoload/*"), "\n")
      exe 'source' f
    endfor

    source $MYVIMRC
  endfunction
endif
