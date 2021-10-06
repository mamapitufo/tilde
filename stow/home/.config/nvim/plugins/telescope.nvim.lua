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
      '!.git',
      '--hidden'
    }
  },
  pickers = {
    buffers = {
      sort_lastused = true,
      theme = 'dropdown',
      previewer = false
    },
    find_files = {
      hidden = true
    }
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    }
  }
}

require('telescope').load_extension('fzy_native')

require('which-key').register({
  ['<leader>'] = {
    bb = { '<cmd>Telescope buffers<cr>', 'Search buffers' },
    fc = { '<cmd>Telescope find_files cwd=$HOME/Sandbox/tilde prompt_prefix=\\ ~\\  promp_title=Sandbox/tilde<cr>', 'Find config file' },
    ff = { '<cmd>Telescope find_files<cr>', 'Find file' },
    ['*'] = { '<cmd>Telescope grep_string<cr>', 'Find current string' },
    ['s/'] = { '<cmd>Telescope search_history<cr>', 'Search history' },
    ['s:'] = { '<cmd>Telescope command_history<cr>', 'Command history' },
    sf = { '<cmd>Telescope live_grep<cr>', 'Grep in project' },
    sh = { '<cmd>Telescope help_tags<cr>', 'Find help' },
  }
})

