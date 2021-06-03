" mappings @ mamapitufo
" vim: fdm=marker

" Easier <Esc>
inoremap jk <esc>
cnoremap jk <c-c>

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
nnoremap <silent> <leader>gs :Git<cr>
" Commit
nnoremap <silent> <leader>gcc :Git commit --verbose<cr>
nnoremap <silent> <leader>gcC :Git commit --verbose --all<cr>
nnoremap <silent> <leader>gca :Git commit --amend --no-edit<cr>
nnoremap <silent> <leader>gcA :Git commit --amend --no-edit --all<cr>
nnoremap <silent> <leader>gcw :Git commit --amend --verbose<cr>
nnoremap <silent> <leader>gcW :Git commit --amend --verbose --all<cr>
" Diffs
nnoremap <silent> <leader>gd :Ghdiffsplit<cr>
nnoremap <silent> <leader>gD :Gdiffsplit<cr>
nnoremap <silent> <leader>gb :Git_blame<cr>
" Remotes
nnoremap <silent> <leader>gf :Git fetch<cr>
nnoremap <silent> <leader>gF :Git pull<cr>
nnoremap <silent> <leader>gP :Git push<cr>
nnoremap <silent> <leader>gPf :Git push --force<cr>
" Hunks
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
nmap <silent> <leader>ghp <Plug>(GitGutterPreviewHunk)
nmap <silent> <leader>ghs <Plug>(GitGutterStageHunk)
nmap <silent> <leader>ghu <Plug>(GitGutterUndoHunk)
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
