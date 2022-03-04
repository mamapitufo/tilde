call plug#begin()
  Plug 'moll/vim-bbye'                " close buffer without changing the layout
  Plug 'mcchrish/zenbones.nvim'       " colourscheme
  Plug 'rktjmp/lush.nvim'
  Plug 'blankname/vim-fish'
  Plug 'habamax/vim-asciidoctor'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'hoob3rt/lualine.nvim'         " Statusline
  Plug 'jiangmiao/auto-pairs'         " Auto-close parenthesis, brackets, strings, etc.
  Plug 'folke/which-key.nvim'         " Key mapping hints
  Plug 'kyazdani42/nvim-tree.lua'     " File browser
  " Plug 'lambdalisue/suda.vim'
  Plug 'nvim-lua/plenary.nvim'        " Lua helper functions
  Plug 'PeterRincker/vim-argumentative' " Function argument helpers
  Plug 'tpope/vim-projectionist'      " Granular project configuration

  " Run processes
  Plug 'tpope/vim-dispatch'
  Plug 'radenling/vim-dispatch-neovim'

  " Benchmark, while working on the config...
  " Plug 'tweekmonster/startuptime.vim'

  " Finder, picker, previewer...
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzy-native.nvim'

  " Parser tools
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'p00f/nvim-ts-rainbow'       " rainbow parenthesis

  " LSP
  Plug 'neovim/nvim-lspconfig'

  " Completion
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-nvim-lua'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'PaterJason/cmp-conjure'

  Plug 'tpope/vim-unimpaired'         " Complimentary mappings
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'           " Git tools
  Plug 'tpope/vim-sleuth'             " Automatically adjusts tab/spaces from surrounding files
  Plug 'tpope/vim-surround'           " Manipulate surrounding pairs
  Plug 'tpope/vim-repeat'             " Allow plugins to tap into `.`
  Plug 'tpope/vim-eunuch'             " Vim sugar for shell commands

  Plug 'clojure-vim/clojure.vim'
  Plug 'Olical/conjure', {'tag': 'v4.30.1'}
  Plug 'guns/vim-sexp'
  Plug 'tpope/vim-sexp-mappings-for-regular-people'
  Plug 'bakpakin/fennel.vim'
  Plug 'clojure-vim/vim-jack-in'

  Plug 'windwp/nvim-ts-autotag'
  Plug 'JoosepAlviste/nvim-ts-context-commentstring'
  Plug 'norcalli/nvim-colorizer.lua'
call plug#end()

" load vimL plugin configs from `plugconfig/` and warn if the plugin is no
" longer used
for plugconfig in split(glob(stdpath('config') . '/plugconf/*'), '\n')
  let plugname = fnamemodify(plugconfig, ':t:r')

  if (exists('g:plugs["' . plugname . '"]'))
    exec 'source' plugconfig
  else
    echom 'WARN: Triying to configure non-existent plugin ' . plugname
  endif
endfor

" loads lua plugin config files from the `tilde.plugconf` namespace.
" TODO have a `lua/tilde/plugconf/init.lua` that handles this and just require
" that from here.
for plugmod in split(glob(stdpath('config') . '/lua/tilde/plugconf/*.lua'), '\n')
  let plugname = fnamemodify(plugmod, ':t:r')

  if (exists('g:plugs["' . plugname . '"]'))
    exec 'luafile' plugmod
  else
    echom 'WARN: Triying to configure non-existent plugin ' . plugname
  endif
endfor
