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
}

local function map(mode, l, r, opts)
  opts = opts or {}
  vim.keymap.set(mode, l, r, opts)
end

map('n', '<leader>bb', ':Telescope buffers<cr>')
map('n', '<leader>fc', ':Telescope find_files hidden=true cwd=$HOME/Sandbox/tilde prompt_prefix=\\ ~\\  prompt_title=Sandbox/tilde<cr>')
map('n', '<leader>ff', ':lua require\'tilde.telescope-extras\'.git_files_fallback()<cr>')
map('n', '<leader>fr', ':Telescope oldfiles<cr>')
map('n', '<leader>*', ':Telescope grep_string<cr>')
map('n', '<leader>s/', ':Telescope search_history<cr>')
map('n', '<leader>s:', ':Telescope command_history<cr>')
map('n', '<leader>sb', ':Telescope current_buffer_fuzzy_find<cr>')
map('n', '<leader>sf', ':Telescope live_grep<cr>')
map('n', '<leader>sh', ':Telescope help_tags<cr>')
map('n', '<leader>gl', ':Telescope git_commits<cr>')
map('n', '<leader>glb', ':Telescope git_bcommits<cr>')

local status_ok, which_key = pcall(require, 'which-key')
if not status_ok then
  return
end

which_key.register({
  ['<leader>'] = {
    bb = 'Find buffer',
    fc = 'Find config file',
    ff = 'Find file',
    fr = 'Find recently opened file',
    ['*'] = 'Find string under cursor',
    ['s/'] = 'Find in search history',
    ['s:'] = 'Find in command history',
    sb = 'Fuzzy find in current buffer',
    sf = 'Grep in project',
    sh = 'Find help',
    gl = 'Git log',
    glb = 'Git log for buffer file',
  },
})
