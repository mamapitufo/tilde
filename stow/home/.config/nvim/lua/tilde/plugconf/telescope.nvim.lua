local actions = require('telescope.actions')

require('telescope').setup{
  defaults = {
    file_ignore_patterns = {'node_modules'},
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden',
    },
  },
  pickers = {
    buffers = {
      sort_lastused = true,
      theme = 'dropdown',
      previewer = false,
    },
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
  },
}

require('telescope').load_extension('fzy_native')

local map = vim.api.nvim_set_keymap
local map_opts = { silent = true, noremap = true }
map('n', '<leader>bb', ':Telescope buffers<cr>', map_opts)
map('n', '<leader>fc', ':Telescope find_files hidden=true cwd=$HOME/Sandbox/tilde prompt_prefix=\\ ~\\  prompt_title=Sandbox/tilde<cr>', map_opts)
map('n', '<leader>ff', ':lua require\'tilde.telescope-extras\'.git_files_fallback()<cr>', map_opts)
map('n', '<leader>*', ':Telescope grep_string<cr>', map_opts)
map('n', '<leader>s/', ':Telescope search_history<cr>', map_opts)
map('n', '<leader>s:', ':Telescope command_history<cr>', map_opts)
map('n', '<leader>sf', ':Telescope live_grep<cr>', map_opts)
map('n', '<leader>sh', ':Telescope help_tags<cr>', map_opts)

require('which-key').register({
  ['<leader>'] = {
    bb = 'Find buffer',
    fc = 'Find config file',
    ff = 'Find file',
    ['*'] = 'Find string under cursor',
    ['s/'] = 'Find in search history',
    ['s:'] = 'Find in command history',
    sf = 'Grep in project',
    sh = 'Find help',
  },
})
