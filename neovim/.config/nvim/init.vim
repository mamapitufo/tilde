runtime tilde-fns.vim
set shell=sh

call LoadModule('options')
call LoadModule('plugins')

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

" {{{ Filetype-specific behavior
autocmd BufNewFile,BufRead /*.rasi setfiletype css

autocmd FileType gitcommit nnoremap <buffer> <localleader>c :wq<cr>
autocmd FileType gitcommit nnoremap <buffer> <localleader>k :%d <bar> :wq!<cr>
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

nmap <silent> gd <Plug>(coc-definition)

let mapleader="\<Space>"
let maplocalleader=","

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
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
nmap <leader>ghp <Plug>(GitGutterPreviewHunk)
nmap <leader>ghs <Plug>(GitGutterStageHunk)
nmap <leader>ghu <Plug>(GitGutterUndoHunk)
" }}}
" {{{ Help
nnoremap <leader>h<space> :Helptags<cr>
nnoremap <leader>hb :Maps<cr>
nnoremap <leader>hc :Commands<cr>
" }}}
" {{{ Local
nnoremap <silent> <localleader>== <Plug>(AleFix)
" }}}
" {{{ Quit
nnoremap <leader>qQ :qa!<cr>
nnoremap <leader>qa :qa<cr>
nnoremap <silent> <leader>qq :q<cr>
" }}}
" {{{ Refactor
nmap <silent> <localleader>rrs <Plug>(coc-rename)
" }}}
" {{{ Search
nnoremap <leader>* :RgStar <c-r><c-w><cr>
nnoremap <leader>s: :History:<cr>
nnoremap <leader>sf :Rg<cr>
nnoremap <silent> <leader>sc :nohlsearch<cr>
nmap <silent> <leader>ssr <Plug>(coc-references)
" }}}
" {{{ Text
nnoremap <silent> <leader>xdw :let _s=@/ <bar> :%s/\s\+$//e <bar> :let @/=_s <bar> :nohl <bar> :unlet _s <cr>
" }}}
" {{{ Toggle
nnoremap <silent> <leader>t= :if g:ale_fix_on_save \| let g:ale_fix_on_save=0 \| else \| let g:ale_fix_on_save=1 \| endif<cr>
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

let localrc='~/.nvim.local.vim'
if filereadable(localrc)
  source localrc
endif
"
" }}}
