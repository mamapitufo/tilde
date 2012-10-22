" ~/.vimrc
set nocompatible
let mapleader='['

" vundle
" ==========================================================
"
filetype off
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-markdown'
Bundle 'sukima/xmledit.git'
Bundle 'scrooloose/nerdtree'
" Bundle 'tpope/vim-fugitive'
" Bundle 'mileszs/ack.vim'
" Bundle 'tpope/vim-surround'
" Bundle 'majutsushi/tagbar'
" Bundle 'mattn/gist-vim'

filetype plugin indent on
" 
" ==========================================================


syntax on
set encoding=utf-8
set modeline

set smartindent
set foldmethod=indent
set foldlevel=20

set textwidth=78
set nobackup
set history=50

" Search
set hlsearch
set showmatch

" the damian tab
set backspace=indent,eol,start
set smarttab
set expandtab
set tabstop=4
set shiftwidth=4
set shiftround

set background=light
colorscheme solarized

let html_use_css=1
set laststatus=2
set number

" matches
match Todo /KLUDGE/

" statusline
set statusline=%f\ line:\ %l\ col:\ %v\ (%p%%)\ %L\ lines

" plugin config
so ~/.vim/addons/pluginconf.vim

