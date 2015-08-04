let g:ctrlp_lazy_update=1
let g:ctrlp_clear_cache_on_exit=1

if executable('ag')
  let g:ctrlp_user_command='ag %s -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'
endif

