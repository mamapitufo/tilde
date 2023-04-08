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

require 'tilde.options'
require 'tilde.mappings'

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
vim.keymap.set('n', '<leader>bb', tbuiltin.buffers, { desc = 'Find buffer' })
vim.keymap.set(
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
vim.keymap.set('n', '<leader>ff', tbuiltin.find_files, { desc = 'Find file' })
vim.keymap.set(
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
vim.keymap.set('n', '<leader>fr', tbuiltin.oldfiles, { desc = 'Find recently opened file' })
vim.keymap.set('n', '<leader>*', function() tbuiltin.grep_string { word_match = '-w' } end, { desc = 'Find string under cursor' })
vim.keymap.set('n', '<leader>s/', tbuiltin.search_history, { desc = 'Find in search history' })
vim.keymap.set('n', '<leader>s:', tbuiltin.command_history, { desc = 'Find in command history' })
vim.keymap.set('n', '<leader>sd', tbuiltin.diagnostics, { desc = 'Find in diagnostics' })
vim.keymap.set('n', '<leader>sf', tbuiltin.live_grep, { desc = 'Grep in project' })
vim.keymap.set('n', '<leader>sh', tbuiltin.help_tags, { desc = 'Find help' })
vim.keymap.set('n', '<leader>gl', tbuiltin.git_commits, { desc = 'Git log' })
vim.keymap.set('n', '<leader>glb', tbuiltin.git_bcommits, { desc = 'Git log for buffer' })

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
