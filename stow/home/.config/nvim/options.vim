" search
set ignorecase smartcase        " Case insensitive search, but respect case if UC is used

" tabs & spaces
set shiftwidth=4 tabstop=4 softtabstop=4 shiftround copyindent

" ui
set cursorline                  " Highlight current line
set number relativenumber
set shortmess=atOI              " Abbrev, overwrite read msgs, no intro msg
set noshowmode                  " Do not show mode message on last line
set listchars=tab:→\ ,trail:·,extends:↷,precedes:↶
set pumheight=7                 " Max lines in auto-completion menu
set lazyredraw                  " Delay redrawing the screen while executing macros
set signcolumn=yes              " Always show the gutter
set mouse=a
set title

" behavior
set splitright splitbelow
set showmatch                   " Hilight matching parenthesis/brackets/etc
set matchtime=3                 " Show the matching paren for n tenths of a second
set scrolloff=3 scrolljump=5    " Space near the edge of the screen when scrolling
set nowrap linebreak            " Don't wrap, but break on word boundaries when doing so
set formatoptions=tcrqj         " Auto-wrap text and comments, continue and format comments, smart comment join
set timeoutlen=700 ttimeoutlen=500 updatetime=500
set completeopt=menuone,preview " always show the menu and force a selection
set confirm                     " ask to save when quiting and there are unsaved changes
set textwidth=100

" file & buffer navigation
set autowrite                   " Write file when leaving a modified buffer
set hidden                      " Allow buffer switching without saving (`autowrite` should save for us)
set report=0                    " *Always* report changed lines
set whichwrap=b,<,>,h,l         " Allow backspace, arrows and h/l to cross line boundaries
set wildignore+=*swp,*.class,*.pyc,*.png,*.jpg,*.gif,*.zip,tmp/*,*.o,*.obj,*.so   " Taken from vim-better-default
set wildmenu wildmode=longest:full,full

" persistence
set nobackup writebackup backupdir=$HOME/.local/share/nvim/backup//
set undofile undodir=$HOME/.local/share/nvim/undo//

" system
set fileencoding=utf-8
set clipboard=unnamedplus
set grepprg=rg\ --vimgrep
set spelllang=en_gb,en,es,fr
set isfname-==                  " Do not consider `=` part of filenames

" folds
set foldmethod=indent foldnestmax=10 foldlevel=10
