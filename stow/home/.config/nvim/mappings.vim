" mappings @ mamapitufo

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

