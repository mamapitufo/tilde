" plugin management by junegunn/vim-plug, list in `/plugins.vim`
call plug#begin()
execute "source" NvimDir("plugins.vim")
call plug#end()

" load configuration for plugins, defined in `/modules/plugin/<plugin-name>.vim`
for plugconfig in split(glob(NvimDir('modules/plugins/*.vim')), '\n')
  let plugname = fnamemodify(plugconfig, ':t:r')

  if (exists('g:plugs["' . plugname . '"]'))
    exec 'source' plugconfig
  else
    echom 'There is no plugin for config file ' . plugconfig
  endif
endfor

