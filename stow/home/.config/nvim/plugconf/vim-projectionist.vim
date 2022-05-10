autocmd User ProjectionistDetect
  \ call projectionist#append(getcwd(),
  \ {
  \   'src/*.clj': {
  \     'alternate': 'test/{}_test.clj',
  \     'type': 'source'
  \   },
  \   'test/*_test.clj': {
  \     'alternate': 'src/{}.clj',
  \     'type': 'test'
  \   },
  \   'src/*.cljs': {
  \     'alternate': 'src/{}_test.cljs',
  \     'type': 'source'
  \   },
  \   'src/*_test.cljs': {
  \     'alternate': 'src/{}.cljs',
  \     'type': 'test'
  \   },
  \ })
