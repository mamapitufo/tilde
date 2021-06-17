local actions = require('telescope.actions')

require('telescope').setup{
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
