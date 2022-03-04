local map = vim.api.nvim_set_keymap
local map_opts = { silent = true, noremap = true }

map('n', '<leader>gs', ':Git<cr>', map_opts)

map('n', '<leader>gcc', ':Git commit --verbose<cr>', map_opts)
map('n', '<leader>gcC', ':Git commit --verbose --all<cr>', map_opts)
map('n', '<leader>gca', ':Git commit --amend --no-edit<cr>', map_opts)
map('n', '<leader>gcA', ':Git commit --amend --no-edit --all<cr>', map_opts)
map('n', '<leader>gcw', ':Git commit --amend --verbose<cr>', map_opts)
map('n', '<leader>gcW', ':Git commit --amend --verbose --all<cr>', map_opts)

map('n', '<leader>gd', ':Ghdiffsplit<cr>', map_opts)
map('n', '<leader>gD', ':Gdiffsplit<cr>', map_opts)
map('n', '<leader>gb', ':Git blame<cr>', map_opts)

map('n', '<leader>gf', ':Git fetch<cr>', map_opts)
map('n', '<leader>gF', ':Git smart-pull<cr>', map_opts)
map('n', '<leader>gP', ':Git push<cr>', map_opts)
map('n', '<leader>gPf', ':Git push --force<cr>', map_opts)

require'which-key'.register {
  ['<leader>gs'] = 'Status',

  ['<leader>gcc'] = 'Commit staged changes',
  ['<leader>gcC'] = 'Commit all changes',
  ['<leader>gca'] = 'Amend last commit',
  ['<leader>gcA'] = 'Amend last commit with staged',
  ['<leader>gcw'] = 'Reword last commit',
  ['<leader>gcW'] = 'Reword last commit with staged',

  ['<leader>gd'] = 'Diff',
  ['<leader>gD'] = 'Diff (vertical)',
  ['<leader>gb'] = 'Blame',

  ['<leader>gf'] = 'Fetch',
  ['<leader>gF'] = 'Pull',
  ['<leader>gP'] = 'Push',
  ['<leader>gPf'] = 'Force push',
}
