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
  callback = require('mini.trailspace').trim,
  group = format_group,
  pattern = '*',
})
