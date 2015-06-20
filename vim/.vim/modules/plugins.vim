" plugin management by junegunn/vim-plug
" plugin configuration goes in modules/plugin/<plugin-name>.vim
call plug#begin('~/.vim/bundle')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'moll/vim-bbye'
Plug 'altercation/vim-colors-solarized'
Plug 'rking/ag.vim'
Plug 'Raimondi/delimitMate'
Plug 'pangloss/vim-javascript'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'helino/vim-json'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'

call plug#end()

" load configuration for plugins
for plugconfig in split(glob('~/.vim/modules/plugins/*.vim'), '\n')
  exec 'source' plugconfig
endfor

