if !has('python')
  echo 'You need +python in order to use Ctrlp python matcher'
else
  let g:ctrlp_match_func={ 'match': 'pymatcher#PyMatch' }
endif

