-- [[ autocommands ]]

-- highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- trim whitespace on write
local format_group = vim.api.nvim_create_augroup('FormatOnWrite', { clear = true })
vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function()
    local ts = require 'mini.trailspace'
    ts.trim()
    ts.trim_last_lines()
  end,
  group = format_group,
  pattern = '*',
})

-- git commits
local gitcommit_group = vim.api.nvim_create_augroup('GitCommit', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'gitcommit',
  callback = function()
    vim.keymap.set('n', '<localleader>c', ':wq<cr>', { desc = 'Commit', buffer = true })
    vim.keymap.set('n', '<localleader>k', ':%d <bar> :wq!<cr>', { desc = 'Abort', buffer = true })
    vim.wo.number = false
    vim.wo.relativenumber = false
  end,
  group = gitcommit_group,
})
