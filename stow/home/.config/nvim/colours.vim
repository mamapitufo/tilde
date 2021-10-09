let g:markdown_syntax_conceal = 0
let g:markdown_fenced_languages = ['clojure', 'javascript', 'json', 'html', 'css', 'bash=sh']

highlight clear SignColumn  " Ensure gutter has same colour as background

set t_Co=256                " Use 256 colours
set t_ut=                   " http://stackoverflow.com/questions/6427650/vim-in-tmux-background-color-changes-when-paging/15095377#15095377
set termguicolors           " Enables 24-bit colour in the TUI


let g:zenbones_lightness = 'bright'
let g:zenbones_solid_vert_split = v:true

set background=light
colorscheme zenbones-lush
