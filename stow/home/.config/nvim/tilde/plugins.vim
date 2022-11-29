call plug#begin()
  Plug 'echasnovski/mini.nvim'        " plugin library with various bits of functionality
  Plug 'mcchrish/zenbones.nvim'       " colourscheme
  Plug 'rktjmp/lush.nvim'
  Plug 'akinsho/toggleterm.nvim'      " Better built-in terminal

  Plug 'blankname/vim-fish'
  Plug 'habamax/vim-asciidoctor'
  Plug 'kmonad/kmonad-vim'

  Plug 'JoosepAlviste/nvim-ts-context-commentstring' " Needed mostly for JSX
  Plug 'MunifTanjim/prettier.nvim'

  Plug 'lewis6991/gitsigns.nvim'
  Plug 'nvim-lualine/lualine.nvim'    " Statusline
  Plug 'windwp/nvim-autopairs'        " Auto-close parenthesis, brackets, strings, etc.
  Plug 'windwp/nvim-ts-autotag'       " Manage HTML tags
  Plug 'folke/which-key.nvim'         " Key mapping hints
  Plug 'kyazdani42/nvim-tree.lua'     " File browser
  " Plug 'lambdalisue/suda.vim'
  Plug 'nvim-lua/plenary.nvim'        " Lua helper functions
  Plug 'PeterRincker/vim-argumentative' " Function argument helpers
  Plug 'tpope/vim-projectionist'      " Granular project configuration
  Plug 'stevearc/dressing.nvim'       " Improvement over the default `vim.ui` interfaces

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
  Plug 'p00f/nvim-ts-rainbow'         " rainbow parenthesis

  " LSP
  Plug 'neovim/nvim-lspconfig'
  Plug 'jose-elias-alvarez/null-ls.nvim'

  " Completion
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'PaterJason/cmp-conjure'
  Plug 'L3MON4D3/LuaSnip'
  Plug 'saadparwaiz1/cmp_luasnip'

  Plug 'tpope/vim-unimpaired'         " Complimentary mappings
  Plug 'tpope/vim-sleuth'             " Automatically adjusts tab/spaces from surrounding files
  Plug 'tpope/vim-repeat'             " Allow plugins to tap into `.`
  Plug 'tpope/vim-eunuch'             " Vim sugar for shell commands

  Plug 'clojure-vim/clojure.vim'
  Plug 'Olical/conjure'
  Plug 'guns/vim-sexp'
  Plug 'tpope/vim-sexp-mappings-for-regular-people'
  Plug 'bakpakin/fennel.vim'
  Plug 'clojure-vim/vim-jack-in'

  Plug 'norcalli/nvim-colorizer.lua'
call plug#end()
