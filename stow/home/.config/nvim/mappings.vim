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

let mapleader="\<Space>"
let maplocalleader=","

" {{{ Buffer
nnoremap <silent> <leader>bb :Telescope buffers<cr>
nnoremap <silent> <leader>bD :bufdo :Bdelete<cr>  " kills all buffers without modifying the split layout
nnoremap <silent> <leader>bd :Bdelete<cr>         " kills a buffer without closing the split
nnoremap <silent> <leader>bn :bnext<cr>
nnoremap <silent> <leader>bp :bprevious<cr>
" }}}
" {{{ Configuration
nnoremap <silent> <leader>cf :Telescope find_files cwd=$HOME/Sandbox/tilde prompt_prefix=\ ~\  prompt_title=Sandbox/tilde<cr>
nnoremap <silent> <leader>cR :call SourceConfig()<cr>
" }}}
" {{{ File
nnoremap <silent> <leader>ff :Telescope find_files<cr>
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
nnoremap <silent> <leader>gb :Git blame<cr>
" Remotes
nnoremap <silent> <leader>gf :Git fetch<cr>
nnoremap <silent> <leader>gF :Git pull<cr>
nnoremap <silent> <leader>gP :Git push<cr>
nnoremap <silent> <leader>gPf :Git push --force<cr>
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
nmap <silent> <leader>ssr <Plug>(coc-references)
nnoremap <silent> <leader>* :Telescope grep_string<cr>
nnoremap <silent> <leader>s/ :Telescope search_history<cr>
nnoremap <silent> <leader>s: :Telescope command_history<cr>
nnoremap <silent> <leader>sc :nohlsearch<cr>
nnoremap <silent> <leader>sf :Telescope live_grep<cr>
nnoremap <silent> <leader>sh :Telescope help_tags<cr>
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
