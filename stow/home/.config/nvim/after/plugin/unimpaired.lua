if not require('tilde.utils').assert_plug('vim-unimpaired') then return end

local status_ok, which_key = pcall(require, 'which-key')
if not status_ok then
  return
end

which_key.register({
  ['[a'] = { 'Edit previous file in args list' },
  [']a'] = { 'Edit next file in args list' },
  ['[A'] = { 'Edit first file in args list' },
  [']A'] = { 'Edit last file in args list' },
  ['[l'] = { 'Previous entry in the location list' },
  [']l'] = { 'Next entry in the location list' },
  ['[L'] = { 'First entry in the location list' },
  [']L'] = { 'Last entry in the location list' },
  ['[q'] = { 'Previous entry in the quickfix list' },
  [']q'] = { 'Next entry in the quickfix list' },
  ['[Q'] = { 'First entry in the quickfix list' },
  [']Q'] = { 'Last entry in the quickfix list' },
  ['[f'] = { 'Edit previous file in directory' },
  [']f'] = { 'Edit next file in directory' },
  ['[n'] = { 'Previous conflict marker or diff hunk' },
  [']n'] = { 'Next conflict marker or diff hunk' },
  ['[<space>'] = { 'Add blank line above the cursor' },
  [']<space>'] = { 'Add blank line below the cursor' },
  ['[e'] = { 'Swap current line with line above it' },
  [']e'] = { 'Swap current line with line above it' },
})
