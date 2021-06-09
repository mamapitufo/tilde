local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    prompt_position = "top",
    mappings = {
      i = {
        ['<esc>'] = actions.close
      }
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
