call plug#begin()
  Plug 'moll/vim-bbye'                " close buffer without changing the layout
  Plug 'nightsense/cosmic_latte'      " colourscheme
  Plug 'blankname/vim-fish'
  Plug 'airblade/vim-gitgutter'
  Plug 'hoob3rt/lualine.nvim'         " Statusline
  Plug 'dense-analysis/ale'           " Linter
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'jiangmiao/auto-pairs'         " Auto-close parenthesis, brackets, strings, etc.
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzy-native.nvim'

  Plug 'tpope/vim-unimpaired'         " Complimentary mappings
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'           " Git tools
  Plug 'tpope/vim-sleuth'             " Automatically adjusts tab/spaces from surrounding files
  Plug 'tpope/vim-surround'           " Manipulate surrounding pairs
  Plug 'tpope/vim-repeat'             " Allow plugins to tap into `.`
  Plug 'tpope/vim-eunuch'             " Vim sugar for shell commands

  Plug 'clojure-vim/clojure.vim'
  Plug 'Olical/conjure', {'tag': 'v4.20.0'}
  Plug 'guns/vim-sexp'
  Plug 'tpope/vim-sexp-mappings-for-regular-people'
call plug#end()

for plugconfig in split(glob(stdpath('config') . '/plugins/*'), '\n')
  let plugname = fnamemodify(plugconfig, ':t:r')

  if (exists('g:plugs["' . plugname . '"]'))
    let ext = fnamemodify(plugconfig, ':e')
    if (ext ==? 'vim')
      exec 'source' plugconfig
    elseif (ext ==? 'lua')
      exec 'luafile' plugconfig
    else
      echom 'WARN: Unknown config extension on file ' . plugconfig
    endif
  else
    echom 'WARN: No plugin defined for config ' . plugconfig
  endif
endfor
