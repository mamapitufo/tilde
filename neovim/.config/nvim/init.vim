"
" @mamapitufo
"
" vim: foldenable fdm=marker fdl=0 fdls=0
"
" {{{ Core settings

" Use a POSIX shell to run commands from nvim
if &shell =~# 'fish$'
  set shell=sh
endif

" {{{ search
set ignorecase                            " Case insensitive search
set smartcase                             " But respect case if UC is used in search
" }}}
" {{{ tabs & spaces
set expandtab                             " Tabs as spaces
set shiftwidth=2                          " Auto-indent using 2 columns
set tabstop=2                             " Number of spaces per TAB character
set softtabstop=2                         " Number of spaces per <Tab> when editing
set copyindent                            " Copy current line indent when autoindenting a new line.
set shiftround                            " Round indents to multiple of `shiftwidth`
" }}}
" {{{ visual appearance
set cursorline                            " Highlight current line
set number
set relativenumber
set shortmess=atOI                        " Abbrev, overwrite read msgs, no intro msg
set noshowmode                            " Do not show mode message on last line
set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶  " Taken from vim-better-default
set pumheight=15                          " Max lines in auto-completion menu
set lazyredraw                            " Delay redrawing the screen while executing macros
set signcolumn=yes                        " Always show the gutter
" }}}
" {{{ behavior
set splitright                            " New split window to the right of current
set splitbelow                            " New vsplit window to the bottom of current
set showmatch                             " Hilight matching parenthesis/brackets/etc
set matchtime=3                           " Show the matching paren for n tenths of a second
set scrolloff=3                           " Min lines to keep above and below cursor
set scrolljump=3                          " Lines to scroll when cursor is on edge of screen
set nowrap                                " Do not wrap lines
set formatoptions=tcrqj                   " Auto-wrap text and comments, continue and format comments, smart comment join
" }}}
" {{{ file & buffer navigation
set autowrite                             " Write file when leaving a modified buffer
set hidden                                " Allow buffer switching without saving (`autowrite` should save for us)
set report=0                              " Always report changed lines (will not report below n if n > 0)
set wildmode=list:longest,full            " How to complete matches when pressing <Tab> on command line
set whichwrap=b,<,>,h,l                   " Allow backspace, arrows and h/l to cross line boundaries
set wildignore+=*swp,*.class,*.pyc,*.png,*.jpg,*.gif,*.zip,tmp/*,*.o,*.obj,*.so   " Taken from vim-better-default
" }}}
" {{{ persistence
set nobackup
set writebackup
set backupdir=~/.config/nvim/backup//     " FIXME: should be based on `stdpath("config")`

set undofile                              " Persistent undo
set undodir=~/.config/nvim/undo//         " FIXME: should be based on `stdpath("config")`
" }}}
" {{{ system
set fileformats=unix,dos,mac              " Choose unix as default fileformat
set fileencoding=utf-8                    " Always save files as utf-8
set clipboard=unnamedplus,unnamed         " yank, delete, change, put go to the '+' and '*' registers
set grepprg=rg\ --vimgrep
set spelllang=en_gb,en,es,fr
" }}}
" {{{ folds
set foldenable
set foldmethod=indent
set foldlevel=0
set foldlevelstart=1
set foldnestmax=10
" autocmd BufWinEnter * let &foldlevel = max(map(range(1, line('$')), 'foldlevel(v:val)'))
" }}}

" }}} -------------------------------------------------------------------------
" {{{ Filetype-specific behavior
autocmd BufNewFile,BufRead /*.rasi setfiletype css

autocmd FileType gitcommit nnoremap <buffer> <localleader>c :wq<cr>
autocmd FileType gitcommit nnoremap <buffer> <localleader>k :%d <bar> :wq!<cr>
" }}} -------------------------------------------------------------------------
" {{{ Plugins (pre)

" {{{ fzf
let g:fzf_history_dir='~/.local/share/fzf'
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --hidden -g "!.git/" --column --line-number --no-heading --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

command! -bang -nargs=* RgStar
  \ call fzf#vim#grep(
  \   'rg --hidden -g "!.git/" --column --line-number --no-heading --color=never --word-regexp '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
" }}}
" {{{ vim-gitgutter
let g:gitgutter_map_keys=0
" }}}
" {{{ lightline.vim
function!LightlineReadonly()
  return &readonly && &filetype !=# 'help' ? 'RO' : ''
endfunction

function LightlineFilename()
  let l:name = winwidth(0) > 70 ? expand('%:p:h:t') . '/' . expand('%:t') : expand('%:t')
  let filename = expand('%:t') !=# '' ? l:name : '[No Name]'

  let modified = &modified ? ' +' : ''

  return filename . modified
endfunction

function LightlineFileformat()
  let l:encoding = &fileencoding !=# '' ? ' (' . &fileencoding . ')' : ''
  let l:format = &fileformat !=# '' ? &fileformat : ''

  return l:format . l:encoding
endfunction

let g:lightline={
  \ 'colorscheme': 'solarized',
  \ 'component_function': {
  \   'readonly': 'LightlineReadonly',
  \   'filename': 'LightlineFilename',
  \   'fileformat': 'LightlineFileformat',
  \ },
  \ 'active': {
  \   'left': [['mode', 'paste'],
  \            ['readonly', 'filename']],
  \   'right': [['lineinfo'],
  \             ['percent'],
  \             ['filetype', 'fileformat']]
  \ },
  \ }
" }}}

" }}} -------------------------------------------------------------------------
" {{{ Plugins

call plug#begin()
  Plug 'moll/vim-bbye'                " close buffer without changing the layout
  Plug 'nightsense/cosmic_latte'      " colourscheme
  Plug 'blankname/vim-fish'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } | Plug 'junegunn/fzf.vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'itchyny/lightline.vim'        " Statusline
  Plug 'tpope/vim-unimpaired'         " Complimentary mappings
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'           " Git tools
  Plug 'tpope/vim-sleuth'             " Automatically adjusts tab/spaces from surrounding files
  Plug 'tpope/vim-surround'           " Manipulate surrounding pairs
  Plug 'tpope/vim-repeat'             " Allow plugins to tap into `.`
  Plug 'tpope/vim-eunuch'             " Vim sugar for shell commands
call plug#end()

" }}} -------------------------------------------------------------------------
" {{{ Plugins (post)
" }}} -------------------------------------------------------------------------
" {{{ Mappings

" Easier <Esc>
inoremap jk <Esc>
cnoremap jk <C-c>

" Shift visual blocks without exiting VISUAL
vnoremap < <gv
vnoremap > >gv

" Move over wrapped lines by default
nmap j gj
nmap k gk
vmap j gj
vmap k gk

" Move visual selection
vnoremap J :m'>+1<cr>gv=gv
vnoremap K :m'<-2<cr>gv=gv

" Quick command mode
nnoremap <cr> :
autocmd BufReadPost quickfix nnoremap <buffer> <cr> <cr>  " Keep default <cr> behaviour on quickfix

let mapleader = "\<Space>"
let maplocalleader = ","

" {{{ Buffer
nnoremap <leader>bb :Buffers<cr>
nnoremap <silent> <leader>bD :bufdo :Bdelete<cr>  " kills all buffers without modifying the split layout
nnoremap <silent> <leader>bd :Bdelete<cr>         " kills a buffer without closing the split
nnoremap <silent> <leader>bf :bfirst<cr>
nnoremap <silent> <leader>bl :blast<cr>
nnoremap <silent> <leader>bn :bnext<cr>
nnoremap <silent> <leader>bp :bprevious<cr>
" }}}
" {{{ File
nnoremap <leader>ff :Files<cr>
nnoremap <leader>fg :GFiles<cr>
nnoremap <leader>fr :History<cr>
nnoremap <silent> <leader>feR :source $MYVIMRC<cr>
nnoremap <silent> <leader>fs :update<cr>
" }}}
" {{{ Git
nnoremap <silent> <leader>gF :Gpull<cr>
nnoremap <silent> <leader>gP :Gpush<cr>
nnoremap <silent> <leader>gb :Gblame<cr>
nnoremap <silent> <leader>gcA :Gcommit --amend --no-edit --all<cr>
nnoremap <silent> <leader>gcC :Gcommit --verbose -all<cr>
nnoremap <silent> <leader>gcW :Gcommit --amend --verbose --all<cr>
nnoremap <silent> <leader>gca :Gcommit --amend --no-edit<cr>
nnoremap <silent> <leader>gcc :Gcommit --verbose<cr>
nnoremap <silent> <leader>gcw :Gcommit --amend --verbose<cr>
nnoremap <silent> <leader>gd :Gdiff<cr>
nnoremap <silent> <leader>gf :Gfetch<cr>
nnoremap <silent> <leader>gs :Gstatus<cr>
nnoremap <silent> <leader>gw :Gwrite<cr>
nmap ]c <Plug>(GitGutterNextHunk)
nmap [c <Plug>(GitGutterNextHunk)

" }}}
" {{{ Help
nnoremap <leader>h<space> :Helptags<cr>
nnoremap <leader>hb :Maps<cr>
nnoremap <leader>hc :Commands<cr>
" }}}
" {{{ Quit
nnoremap <leader>qQ :qa!<cr>
nnoremap <leader>qa :qa<cr>
nnoremap <silent> <leader>qq :q<cr>
" }}}
" {{{ Search
nnoremap <leader>* :RgStar <c-r><c-w><cr>
nnoremap <leader>s: :History:<cr>
nnoremap <leader>sf :Rg<cr>
nnoremap <silent> <leader>sc :nohlsearch<cr>
" }}}
" {{{ Text
nnoremap <silent> <leader>xdw :let _s=@/ <bar> :%s/\s\+$//e <bar> :let @/=_s <bar> :nohl <bar> :unlet _s <cr>
" }}}
" {{{ Toggle
nnoremap <silent> <leader>tS :set spell!<cr>
nnoremap <silent> <leader>thh :setlocal cursorline!<cr>
nnoremap <silent> <leader>tl :setlocal wrap!<cr>
nnoremap <silent> <leader>tn :setlocal number!<cr>
nnoremap <silent> <leader>tnr :setlocal relativenumber!<cr>
nnoremap <silent> <leader>tp :setlocal paste!<cr>
nnoremap <silent> <leader>tw :set list!<cr>
" }}}
" {{{ Window
nnoremap <leader>wH <c-w>5<
nnoremap <leader>wJ :resize +5<cr>
nnoremap <leader>wK :resize -5<cr>
nnoremap <leader>wL <c-w>5>
nnoremap <leader>wc <c-w>c
nnoremap <leader>wh <c-w>h
nnoremap <leader>wj <c-w>j
nnoremap <leader>wk <c-w>k
nnoremap <leader>wl <c-w>l
nnoremap <leader>wq <c-w>q
nnoremap <leader>ws <c-w>s
nnoremap <leader>wv <c-w>v
nnoremap <leader>ww <c-w>w
" }}}

" }}} -------------------------------------------------------------------------
" {{{ Colours

highlight clear SignColumn  " Ensure gutter has same colour as background

set t_Co=256          " Use 256 colours
set t_ut=             " http://stackoverflow.com/questions/6427650/vim-in-tmux-background-color-changes-when-paging/15095377#15095377
set termguicolors     " Enables 24-bit colour in the TUI

set background=light
colorscheme cosmic_latte

" }}} -------------------------------------------------------------------------
" {{{ Local configuration

let localrc = '~/.nvim.local.vim'
if filereadable(localrc)
  source localrc
endif
"
" }}}

