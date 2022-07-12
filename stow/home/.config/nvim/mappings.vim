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

" Select pasted text
nnoremap gp `[v`]

let mapleader="\<Space>"
let maplocalleader=","

nnoremap <silent> <leader>bp :bprev<cr>
nnoremap <silent> <leader>bn :bnext<cr>
nnoremap <silent> <leader>bP :bfirst<cr>
nnoremap <silent> <leader>bN :blast<cr>

nnoremap <silent> <leader>fs :update<cr>

nnoremap <leader>qq :qa<cr>
nnoremap <leader>qQ :qa!<cr>

nnoremap <leader>sc :nohlsearch<cr>

nnoremap <leader>ts :set spell!<cr>
nnoremap <leader>th :setlocal cursorline!<cr>
nnoremap <leader>tw :setlocal wrap!<cr>
nnoremap <leader>tn :setlocal number!<cr>
nnoremap <leader>tr :setlocal relativenumber!<cr>
nnoremap <leader>tp :setlocal paste!<cr>
nnoremap <silent> <leader>te :lua vim.diagnostic.open_float()<cr>
nnoremap <silent> <leader>tb :call ToggleBackground()<cr>


nnoremap <leader>wk <c-w>k
nnoremap <leader>wj <c-w>j
nnoremap <leader>wh <c-w>h
nnoremap <leader>wl <c-w>l
nnoremap <leader>wq <c-w>q
nnoremap <leader>ws <c-w>s
nnoremap <leader>wv <c-w>v
nnoremap <leader>ww <c-w>w
nnoremap <leader>wx <c-w>x
nnoremap <leader>w= <c-w>=
nnoremap <leader>wK :resize -5<cr>
nnoremap <leader>wJ :resize +5<cr>
nnoremap <leader>wH <c-w>5<
nnoremap <leader>wL <c-w>5>
nnoremap <leader>w<bar> <c-w><bar>

tnoremap <esc> <c-\><c-n>

nnoremap [d :lua vim.diagnostic.goto_prev()<cr>
nnoremap ]d :lua vim.diagnostic.goto_next()<cr>
nnoremap <leader>eq :lua vim.diagnostic.setqflist()<cr>
