" search
set ignorecase                  " Case insensitive search
set smartcase                   " But respect case if UC is used in search

" tabs & spaces
set shiftwidth=4                " Auto-indent using 2 columns
set tabstop=4                   " Number of spaces per TAB character
set softtabstop=4               " Number of spaces per <Tab> when editing
set copyindent                  " Copy current line indent when autoindenting a new line.
set shiftround                  " Round indents to multiple of `shiftwidth`

" ui
set cursorline                  " Highlight current line
set number
set relativenumber
set shortmess=atOI              " Abbrev, overwrite read msgs, no intro msg
set noshowmode                  " Do not show mode message on last line
set listchars=tab:→\ ,trail:·,extends:↷,precedes:↶
set pumheight=7                " Max lines in auto-completion menu
set lazyredraw                  " Delay redrawing the screen while executing macros
set signcolumn=yes              " Always show the gutter
set mouse=a

" behavior
set splitright
set splitbelow
set showmatch                   " Hilight matching parenthesis/brackets/etc
set matchtime=3                 " Show the matching paren for n tenths of a second
set scrolloff=3                 " Min lines to keep above and below cursor
set scrolljump=5                " Lines to scroll when cursor is on edge of screen
set nowrap
set formatoptions=tcrqj         " Auto-wrap text and comments, continue and format comments, smart comment join
set timeoutlen=700              " wait 0.5s for mappings to complete
set updatetime=500              " wait 0.5s for CursorHold
set completeopt=menuone,preview " always show the menu and force a selection

" file & buffer navigation
set autowrite                   " Write file when leaving a modified buffer
set hidden                      " Allow buffer switching without saving (`autowrite` should save for us)
set report=0                    " *Always* report changed lines
set wildmode=list:longest,full  " How to complete matches when pressing <Tab> on command line
set whichwrap=b,<,>,h,l         " Allow backspace, arrows and h/l to cross line boundaries
set wildignore+=*swp,*.class,*.pyc,*.png,*.jpg,*.gif,*.zip,tmp/*,*.o,*.obj,*.so   " Taken from vim-better-default

" persistence
set nobackup
set writebackup
set undofile
set backupdir=$HOME/.local/share/nvim/backup//      " TODO: this should use `stdpath('data')`!
set undodir=$HOME/.local/share/nvim/undo//

" system
set fileencoding=utf-8
set clipboard=unnamedplus
set grepprg=rg\ --vimgrep
set spelllang=en_gb,en,es,fr
set isfname-==                  " Do not consider `=` part of filenames

" folds
set foldmethod=indent
set foldnestmax=10
set foldlevel=10
