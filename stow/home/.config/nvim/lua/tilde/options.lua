-- [[ setting options ]]
-- search
vim.o.ignorecase = true
vim.o.smartcase = true

-- tabs & spaces
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftround = true
vim.o.copyindent = true

-- ui settings
vim.o.cursorline = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = 'a'
vim.wo.signcolumn = 'yes'                   -- always show the gutter
vim.o.title = true
vim.o.shortmess = 'atOI'                    -- Abbrev, overwrite read msgs, no intro msg
vim.o.showmode = false                      -- Do not show mode message on last line
vim.opt.listchars = { tab = '→ ', trail = '·', extends = '↷', precedes = '↶' }
vim.o.pumheight = 7                         -- Max lines in auto-completion menu
vim.o.lazyredraw = true                     -- Delay redrawing the screen while executing macros

-- behavior
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.scrolloff = 3
vim.o.scrolljump = 5                        -- Show a few lines at the edges when scrolling
vim.o.wrap = false
vim.o.linebreak = true                      -- Don't wrap, but break on word boundaries when wrapping
vim.o.breakindent = true                    -- keep visual indent when wrapping
vim.o.formatoptions = 'tcrqj'               -- Auto-wrap text and comments, continue and format comments, smart comment join
vim.o.updatetime = 250                      -- Decrease update time
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.completeopt = 'menuone,preview'       -- Always show complete, force a selection
vim.o.confirm = true                        -- Ask to save when quitting unsaved buffers

-- file & buffer navigation
vim.o.autowrite = true                      -- Write file when leaving a modified buffer
vim.o.hidden = true                         -- Allow buffer switching without explicit save
vim.o.report = 0                            -- Always report num lines changed by command
vim.o.whichwrap = 'b,<,>,h,l'               -- Allow BS, arrows and h/l to cross line boundaries
vim.o.wildignore = '*swp,*.class,*.pyc,*.png,*.jpg,*.gif,*.zip,tmp/*,*.o,*.obj,*.so'
vim.o.wildmenu = true
vim.o.wildmode = 'longest:full,full'

-- system
vim.o.clipboard = 'unnamedplus'             -- Sync clipboard between OS and Neovim.
vim.o.grepprg = 'rg --vimgrep'
vim.o.spelllang = en_gb,en,es,fr
-- vim.o.isfname:remove '='                    -- `=` is not part of a filename in `gf`, for example

-- persistence
vim.o.backup = false
vim.o.writebackup = true
vim.o.backupdir = vim.fn.stdpath('data') .. '/backup//'
vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath('data') .. '/undo//'
