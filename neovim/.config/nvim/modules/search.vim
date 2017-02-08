" Case insensitive search until uppercase is used
set ignorecase
set smartcase

" from tpope/vim-sensible, map <c-l> to clear the highlighting of :set hlsearch.
if maparg('<c-l>', 'n') ==# ''
  noremap <silent> <c-l> :nohlsearch<c-r>=has('diff')?'<Bar>diffupdate':''<cr><cr><c-l>
endif

