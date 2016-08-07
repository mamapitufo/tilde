" plugin management by junegunn/vim-plug
" plugin configuration goes in modules/plugin/<plugin-name>.vim
call plug#begin()

Plug 'moll/vim-bbye'
Plug 'altercation/vim-colors-solarized'
Plug 'rking/ag.vim'
Plug 'Raimondi/delimitMate'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'helino/vim-json'
Plug 'scrooloose/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sjl/gundo.vim'
Plug 'mtth/scratch.vim'
Plug 'airblade/vim-gitgutter'
Plug 'embear/vim-localvimrc'
Plug 'Keithbsmiley/tmux.vim'

Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-scriptease'

Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'Valloric/YouCompleteMe', { 'do': './install.py', 'for': 'javascript' }
Plug 'marijnh/tern_for_vim', { 'do': 'npm install', 'for': 'javascript' }

Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
" Plug 'guns/vim-sexp', { 'for': 'clojure' }
" Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
Plug 'kovisoft/paredit', { 'for': 'clojure' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-salve', { 'for': 'clojure' }
Plug 'kien/rainbow_parentheses.vim', { 'for': 'clojure' }

Plug 'lambdatoast/elm.vim', { 'for': 'elm' }

call plug#end()

" load configuration for plugins
for plugconfig in split(glob(NvimDir('modules/plugins/*.vim')), '\n')
	let plugname = fnamemodify(plugconfig, ':t:r')

	if (exists('g:plugs["' . plugname . '"]'))
		exec 'source' plugconfig
	else
		echom 'There is no plugin for config file ' . plugconfig
	endif
endfor

