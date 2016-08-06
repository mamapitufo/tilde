let g:ctrlp_lazy_update=1
let g:ctrlp_max_files=0
let g:ctrlp_root_markers=[ 'project.clj' ]

if executable('ag')
  let g:ctrlp_user_command='ag %s -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --ignore ''jasmine-reports'' --ignore ''target'' --hidden -g ""'
endif

