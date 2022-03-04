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
  \ })
