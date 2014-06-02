" ~/.vimrc
set nocompatible
let mapleader='['

scriptencoding utf-8
set encoding=utf-8

" vundle
" ==========================================================
"
filetype off
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-markdown'
Bundle 'sukima/xmledit.git'
Bundle 'scrooloose/nerdtree'
Bundle 'moll/vim-bbye'
Bundle 'scrooloose/nerdcommenter'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-fugitive'
Bundle 'sjl/gundo.vim'

Bundle 'guns/vim-clojure-static'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'tpope/vim-fireplace'

Bundle 'jelera/vim-javascript-syntax'
Bundle 'pangloss/vim-javascript'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/syntastic'
Bundle 'Valloric/YouCompleteMe'
Bundle 'marijnh/tern_for_vim'


filetype plugin indent on
"
" ==========================================================

syntax on
set nomodeline
set ttyfast

set showcmd
set wildmenu
set wildmode=longest,full
" set hidden

set cursorline "cursorcolumn

set smartindent
set foldmethod=indent
set foldlevel=20
set formatoptions=qrn1l

set textwidth=72
set nobackup
set noswapfile
set undofile
set undodir=~/.vim/undo
set history=50

set colorcolumn=80
" set nowrap
" set sidescroll=5
" set listchars+=precedes:<,extends:>

" Search
set hlsearch
set showmatch
set incsearch
set ignorecase
set smartcase

" the damian tab
set backspace=indent,eol,start
set smarttab
set expandtab
set tabstop=2
set shiftwidth=2
set shiftround

set t_Co=256
set background=light
colorscheme solarized

set shortmess=atI

set laststatus=2
set number
" set relativumber

" better splits
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-l> <C-w><C-l>
set splitbelow
set splitright

" plugin config
so ~/.vim/addons/pluginconf.vim

