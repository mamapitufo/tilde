-- [[ keymaps ]]

-- easier <esc>
vim.keymap.set({ 'i', 'v' }, 'jk', '<esc>')
vim.keymap.set('c', 'jk', '<C-c>')
-- ignore space bar on normal and visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

vim.keymap.set('n', 'gp', '`[v`]', { desc = 'Go to and select pasted text' })
vim.keymap.set('n', '<esc>', '<cmd>nohlsearch<cr>')

-- buffer navigation
vim.keymap.set('n', '<leader>bN', '<cmd>blast<cr>', { desc = 'Last buffer' })
vim.keymap.set('n', '<leader>bP', '<cmd>bfirst<cr>', { desc = 'First buffer' })
vim.keymap.set('n', '<leader>bn', '<cmd>bnext<cr>', { desc = 'Next buffer' })
vim.keymap.set('n', '<leader>bp', '<cmd>bprev<cr>', { desc = 'Prev buffer' })

-- diagnostics
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Prev diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic message' })
vim.keymap.set('n', '[e', function()
  vim.diagnostic.goto_prev { severity = 'ERROR' }
end, { desc = 'Prev error' })
vim.keymap.set('n', ']e', function()
  vim.diagnostic.goto_next { severity = 'ERROR' }
end, { desc = 'Next error' })
vim.keymap.set('n', '<leader>dl', function()
  vim.diagnostic.setloclist { open = true }
end, { desc = 'Send diagnostics to Location list' })
vim.keymap.set('n', '<leader>ds', vim.diagnostic.open_float, { desc = 'Show diagnostings' })

vim.keymap.set('t', '<esc><esc>', '<c-\\><c-n>', { desc = 'Exit terminal mode' })

-- split navigation
vim.keymap.set('n', '<leader>wh', '<c-w>h', { desc = 'Move focus to the window on the left' })
vim.keymap.set('n', '<leader>wl', '<c-w>l', { desc = 'Move focus to the window on the right' })
vim.keymap.set('n', '<leader>wj', '<c-w>j', { desc = 'Move focus to the window below' })
vim.keymap.set('n', '<leader>wk', '<c-w>k', { desc = 'Move focus to the window above' })

-- vim: ts=2 sts=2 sw=2 et
