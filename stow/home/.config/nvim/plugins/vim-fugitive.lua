require('which-key').register({
  ['<leader>gs'] = { ':Git<cr>', 'Status' },

  ['<leader>gcc'] = { ':Git commit --verbose<cr>', 'Commit staged' },
  ['<leader>gcC'] = { ':Git commit --verbose --all<cr>', 'Commit all' },
  ['<leader>gca'] = { ':Git commit --amend --no-edit<cr>', 'Amend last commit' },
  ['<leader>gcA'] = { ':Git commit --amend --no-edit --all<cr>', 'Amend last commit with staged' },
  ['<leader>gcw'] = { ':Git commit --amend --verbose<cr>', 'Reword last commit' },
  ['<leader>gcW'] = { ':Git commit --amend --verbose --all<cr>', 'Reword last commit with staged' },

  ['<leader>gd'] = { ':Ghdiffsplit<cr>', 'Diff' },
  ['<leader>gD'] = { ':Gdiffsplit<cr>', 'Diff (vertical)' },
  ['<leader>gb'] = { ':Git blame<cr>', 'Blame' },

  ['<leader>gf'] = { ':Git fetch<cr>', 'Fetch' },
  ['<leader>gF'] = { ':Git pull<cr>', 'Pull' },
  ['<leader>gP'] = { ':Git push<cr>', 'Push' },
  ['<leader>gPf'] = { ':Git push --force<cr>', 'Force push' },
})
