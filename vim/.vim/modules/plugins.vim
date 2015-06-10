" plugin management by junegunn/vim-plug
" plugin configuration goes in modules/plugin/<plugin-name>.vim
call plug#begin('~/.vim/bundle')

Plug 'moll/vim-bbye'

call plug#end()

" load configuration for plugins
for plugconfig in split(glob('~/.vim/modules/plugins/*.vim'), '\n')
  exec 'source' plugconfig
endfor

