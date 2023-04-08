-- NOTE: these must happen before any plugins load
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

vim.o.termguicolors = true

-- Install package manager (https://github.com/folke/lazy.nvim)
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  require 'tilde.plugins',
  require 'tilde.plugins.colours',
  require 'tilde.plugins.syntax',
  require 'tilde.plugins.pickers',
  require 'tilde.plugins.statusline',
  require 'tilde.plugins.git',
  require 'tilde.plugins.ui',

  -- 'tpope/vim-fugitive',
  -- 'tpope/vim-rhubarb',
  --
  -- -- NOTE: This is where your plugins related to LSP can be installed.
  -- --  The configuration is done below. Search for lspconfig to find it below.
  -- { -- LSP Configuration & Plugins
  --   'neovim/nvim-lspconfig',
  --   dependencies = {
  --     -- Automatically install LSPs to stdpath for neovim
  --     'williamboman/mason.nvim',
  --     'williamboman/mason-lspconfig.nvim',
  --
  --     -- Useful status updates for LSP
  --     -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
  --     { 'j-hui/fidget.nvim', opts = {} },
  --
  --     -- Additional lua configuration, makes nvim stuff amazing!
  --     'folke/neodev.nvim',
  --   },
  -- },
  --
  -- -- "gc" to comment visual regions/lines
  -- { 'numToStr/Comment.nvim', opts = {} },
  --
  -- -- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
  -- --       These are some example plugins that I've included in the kickstart repository.
  -- --       Uncomment any of the lines below to enable them.
  -- -- require 'kickstart.plugins.autoformat',
  -- -- require 'kickstart.plugins.debug',
  --
  -- -- NOTE: The import below automatically adds your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  -- --    You can use this folder to prevent any conflicts with this init.lua if you're interested in keeping
  -- --    up-to-date with whatever is in the kickstart repo.
  -- --
  -- --    For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
  -- --
  -- --    An additional note is that if you only copied in the `init.lua`, you can just comment this line
  -- --    to get rid of the warning telling you that there are not plugins in `lua/custom/plugins/`.
  -- { import = 'custom.plugins' },
}, {
  install = {
    colorscheme = { 'zenbones', 'habamax' },
  },
})

-- [[ Setting options ]]
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

-- [[ Basic Keymaps ]]
-- easier <esc>
local kmap = vim.keymap.set

kmap({ 'i', 'v' }, 'jk', '<esc>')
kmap('c', 'jk', '<C-c>')
-- ignore space bar on normal and visual modes
kmap({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
-- move over wrapped lines by default
kmap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
kmap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

kmap('n', 'gp', '`[v`]', { desc = 'Select pasted text' })

-- buffer navigation
kmap('n', '<leader>bN', '<cmd>blast<cr>', { desc = 'Last buffer' })
kmap('n', '<leader>bP', '<cmd>bfirst<cr>', { desc = 'First buffer' })
kmap('n', '<leader>bn', '<cmd>bnext<cr>', { desc = 'Next buffer' })
kmap('n', '<leader>bp', '<cmd>bprev<cr>', { desc = 'Previous buffer' })

-- diagnostics
kmap('n', '[d', vim.diagnostic.goto_prev, { desc = 'Prev diagnostic' })
kmap('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
-- XXX this can also use `vim.diagnostic.setloclist`:
kmap('n', '<leader>dq', vim.diagnostic.setqflist, { desc = 'Send diagnostics to Quickfix' })
kmap('n', '<leader>ds', vim.diagnostic.open_float, { desc = 'Diagnostics for current line' })

-- files
kmap('n', '<leader>fs', '<cmd>update<cr>', { desc = 'Save file' })

-- search
kmap('n', '<leader>sc', '<cmd>nohlsearch<cr>', { desc = 'Clear search highlight' })

-- toggle
kmap('n', '<leader>th', '<cmd>set cursorline!<cr>', { desc = 'Current line highlight' })
kmap('n', '<leader>tn', '<cmd>setlocal number!<cr>', { desc = 'Line numbers' })
kmap('n', '<leader>tp', '<cmd>setlocal paste!<cr>', { desc = 'Paste mode' })
kmap('n', '<leader>tq', function() require('tilde.utils').toggle_qf() end, { desc = 'Quickfix window' })
kmap('n', '<leader>tr', '<cmd>setlocal relativenumber!<cr>', { desc = 'Relative line numbers' })
kmap('n', '<leader>ts', '<cmd>set spell!<cr>', { desc = 'Spell check' })
kmap('n', '<leader>tw', '<cmd>setlocal wrap!<cr>', { desc = 'Line wrap' })

-- quit
kmap('n', '<leader>qQ', '<cmd>qa!<cr>', { desc = 'Force quit' })
kmap('n', '<leader>qq', '<cmd>qa<cr>', { desc = 'Close all windows and quit' })

-- window
kmap('n', '<leader>wk', '<c-w>k', { desc = 'Focus above' })
kmap('n', '<leader>wj', '<c-w>j', { desc = 'Focus below' })
kmap('n', '<leader>wh', '<c-w>h', { desc = 'Focus left' })
kmap('n', '<leader>wl', '<c-w>l', { desc = 'Focus right' })
kmap('n', '<leader>wq', '<c-w>q', { desc = 'Close' })
kmap('n', '<leader>ws', '<c-w>s', { desc = 'Split horizontally' })
kmap('n', '<leader>wv', '<c-w>v', { desc = 'Split vertically' })
kmap('n', '<leader>ww', '<c-w>w', { desc = 'Switch windows' })
kmap('n', '<leader>wx', '<c-w>x', { desc = 'Swap with next window' })
kmap('n', '<leader>w=', '<c-w>=', { desc = 'Make all windows the same size' })
kmap('n', '<leader>wK', ':resize -5<cr>', { desc = 'Decrease height' })
kmap('n', '<leader>wJ', ':resize +5<cr>', { desc = 'Increase height' })
kmap('n', '<leader>wH', '<c-w>5<', { desc = 'Decrease width' })
kmap('n', '<leader>wL', '<c-w>5>', { desc = 'Increase width' })
kmap('n', '<leader>w<bar>', '<c-w><bar>', { desc = 'Maximize width' })

-- [[ Highlight on yank ]]
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- [[ 'nvim-telescope/telescope.nvim' setup ]]
require('telescope').setup {
  defaults = {
    file_ignore_patterns = { "node_modules" },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
    },
  },
  pickers = {
    buffers = {
      sort_lastused = true,
      theme = "dropdown",
      previewer = false,
    },
    find_files = {
      find_command = {
        "rg",
        "--files",
        "--hidden",
        "--smart-case",
        "--glob",
        "!**/.git/*",
      },
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

local tbuiltin = require 'telescope.builtin'
vim.keymap.set('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = 'Fuzzily search in current buffer' })
kmap('n', '<leader>bb', tbuiltin.buffers, { desc = 'Find buffer' })
kmap(
  'n',
  '<leader>fc',
  function()
    tbuiltin.find_files {
      cwd = '~/Sandbox/tilde',
      prompt_prefix = ' ~ ',
      prompt_title = 'Sandbox/tilde',
    }
  end,
  { desc = 'Find config file' }
)
kmap('n', '<leader>ff', tbuiltin.find_files, { desc = 'Find file' })
kmap(
  'n',
  '<leader>fg',
  function()
    vim.fn.system('git rev-parse --is-inside-working-tree')
    if vim.v.shell_error == 0 then
      tbuiltin.git_files()
    else
      tbuiltin.find_files()
    end
  end,
  { desc = 'Find git-controlled file' }
)
kmap('n', '<leader>fr', tbuiltin.oldfiles, { desc = 'Find recently opened file' })
kmap('n', '<leader>*', function() tbuiltin.grep_string { word_match = '-w' } end, { desc = 'Find string under cursor' })
kmap('n', '<leader>s/', tbuiltin.search_history, { desc = 'Find in search history' })
kmap('n', '<leader>s:', tbuiltin.command_history, { desc = 'Find in command history' })
kmap('n', '<leader>sd', tbuiltin.diagnostics, { desc = 'Find in diagnostics' })
kmap('n', '<leader>sf', tbuiltin.live_grep, { desc = 'Grep in project' })
kmap('n', '<leader>sh', tbuiltin.help_tags, { desc = 'Find help' })
kmap('n', '<leader>gl', tbuiltin.git_commits, { desc = 'Git log' })
kmap('n', '<leader>glb', tbuiltin.git_bcommits, { desc = 'Git log for buffer' })

-- [[ 'hrsh7th/nvim-cmp' setup ]]
local cmp = require 'cmp'

cmp.setup {
  completion = {
    autocomplete = false
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'conjure' },
    { name = 'snippy' },
    { name = 'path' },
    { name = 'buffer' },
  }),
  formatting = {
    format = function(entry, vim_item)
      vim_item.menu = ({
        buffer = '[buff]',
        conjure = '[conj]',
        snippy = '[snip]',
        nvim_lsp = '[lsp]',
        path = '[path]',
      })[entry.source.name]
      return vim_item
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<cr>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
  }),
  snippet = {
    expand = function(args)
      require('snippy').expand_snippet(args.body)
    end,
  },
}

-- [[ 'nvim-treesitter/nvim-treesitter' setup ]]
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = {
    'clojure',
    'css',
    'fish',
    'graphql',
    'html',
    'javascript',
    'json',
    'jsonc',
    'json5',
    'lua',
    'rasi',
    'scss',
    'tsx',
    'typescript',
    'toml',
    'vim',
    'yaml',
  },
  auto_install = false,

  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<M-space>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
}

-- -- LSP settings.
-- --  This function gets run when an LSP connects to a particular buffer.
-- local on_attach = function(_, bufnr)
--   -- NOTE: Remember that lua is a real programming language, and as such it is possible
--   -- to define small helper and utility functions so you don't have to repeat yourself
--   -- many times.
--   --
--   -- In this case, we create a function that lets us more easily define mappings specific
--   -- for LSP related items. It sets the mode, buffer and description for us each time.
--   local nmap = function(keys, func, desc)
--     if desc then
--       desc = 'LSP: ' .. desc
--     end
--
--     vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
--   end
--
--   nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
--   nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
--
--   nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
--   nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
--   nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
--   nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
--   nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
--   nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
--
--   -- See `:help K` for why this keymap
--   nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
--   nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
--
--   -- Lesser used LSP functionality
--   nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
--   nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
--   nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
--   nmap('<leader>wl', function()
--     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--   end, '[W]orkspace [L]ist Folders')
--
--   -- Create a command `:Format` local to the LSP buffer
--   vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
--     vim.lsp.buf.format()
--   end, { desc = 'Format current buffer with LSP' })
-- end
--
-- -- Enable the following language servers
-- --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
-- --
-- --  Add any additional override configuration in the following tables. They will be passed to
-- --  the `settings` field of the server config. You must look up that documentation yourself.
-- local servers = {
--   -- clangd = {},
--   -- gopls = {},
--   -- pyright = {},
--   -- rust_analyzer = {},
--   -- tsserver = {},
--
--   lua_ls = {
--     Lua = {
--       workspace = { checkThirdParty = false },
--       telemetry = { enable = false },
--     },
--   },
-- }
--
-- -- Setup neovim lua configuration
-- require('neodev').setup()
--
-- -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
--
-- -- Setup mason so it can manage external tooling
-- require('mason').setup()
--
-- -- Ensure the servers above are installed
-- local mason_lspconfig = require 'mason-lspconfig'
--
-- mason_lspconfig.setup {
--   ensure_installed = vim.tbl_keys(servers),
-- }
--
-- mason_lspconfig.setup_handlers {
--   function(server_name)
--     require('lspconfig')[server_name].setup {
--       capabilities = capabilities,
--       on_attach = on_attach,
--       settings = servers[server_name],
--     }
--   end,
-- }
--
--
-- vim: ts=2 sts=2 sw=2 et
