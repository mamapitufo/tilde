-- [[ options ]]

-- ui settings
vim.o.termguicolors = true
vim.o.relativenumber = true
vim.o.title = true
vim.o.shortmess = 'atOI' -- Abbrev, overwrite read msgs, no intro msg
vim.opt.listchars = { tab = '→ ', trail = '·', extends = '↷', precedes = '↶' }
vim.o.pumheight = 7 -- Max lines in auto-completion menu
vim.o.lazyredraw = true -- Delay redrawing the screen while executing macros

-- behavior
vim.o.scrolloff = 999 -- center current line
vim.o.formatoptions = 'tcrqj' -- Auto-wrap text and comments, continue and format comments, smart comment join
vim.o.updatetime = 250 -- Decrease update time
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.completeopt = 'menuone,preview' -- Always show complete, force a selection
vim.o.confirm = true -- Ask to save when quitting unsaved buffers

-- file & buffer navigation
vim.o.autowrite = true -- Write file when leaving a modified buffer
vim.o.hidden = true -- Allow buffer switching without explicit save
vim.o.report = 0 -- Always report num lines changed by command
vim.o.whichwrap = 'b,<,>,h,l' -- Allow BS, arrows and h/l to cross line boundaries
vim.o.wildignore = '*swp,*.class,*.pyc,*.png,*.jpg,*.gif,*.zip,tmp/*,*.o,*.obj,*.so'
vim.o.wildmenu = true
vim.o.wildmode = 'longest:full,full'

-- system
vim.o.clipboard = 'unnamedplus' -- Sync clipboard between OS and Neovim.
vim.o.grepprg = 'rg --vimgrep'
vim.o.spelllang = en_gb, en, es, fr
-- vim.o.isfname:remove '='                    -- `=` is not part of a filename in `gf`, for example

-- persistence
vim.o.backupdir = vim.fn.stdpath 'data' .. '/backup//'
vim.o.undodir = vim.fn.stdpath 'data' .. '/undo//'
