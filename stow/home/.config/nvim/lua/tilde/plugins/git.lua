local function keymaps(bufnr)
  local gitsigns = require 'gitsigns'
  local kmap = vim.keymap.set

  kmap('n', ']h', function()
    if vim.wo.diff then return ']h' end
    vim.schedule(function() gitsigns.next_hunk() end)
    return '<Ignore>'
  end, {
    expr = true,
    desc = 'Next changed hunk',
  })
  kmap('n', '[h', function()
    if vim.wo.diff then return '[h' end
    vim.schedule(function() gitsigns.prev_hunk() end)
    return '<Ignore>'
  end, {
    expr = true,
    desc = 'Previous changed hunk',
  })

  kmap({ 'n', 'v' }, '<leader>ghs', ':Gitsigns stage_hunk<cr>', { desc = 'Stage hunk' })
  kmap({ 'n', 'v' }, '<leader>ghr', ':Gitsigns reset_hunk<cr>', { desc = 'Reset hunk to git index' })
  kmap('n', '<leader>ghu', gitsigns.undo_stage_hunk, { desc = 'Unstage hunk' })
  kmap('n', '<leader>ghp', gitsigns.preview_hunk, { desc = 'Preview hunk' })
  kmap('n', '<leader>gbl', gitsigns.blame_line, { desc = 'Blame current line' })
  kmap('n', '<leader>gbc', function() gitsigns.blame_line({ full = true }) end, { desc = 'Show current line commit' })

  kmap('n', '<leader>gr', gitsigns.reset_buffer, { desc = 'Reset buffer' })
  kmap('n', '<leader>gR', gitsigns.reset_buffer_index, { desc = 'Reset buffer to git index' })
  kmap('n', '<leader>ga', gitsigns.stage_buffer, { desc = 'Stage buffer' })

  kmap('n', '<leader>tgh', gitsigns.toggle_linehl, { desc = 'Highlight changed lines' })
  kmap('n', '<leader>tgb', gitsigns.toggle_current_line_blame, { desc = 'Blame current line' })
  kmap('n', '<leader>tgd', gitsigns.toggle_deleted, { desc = 'Show deleted hunks' })

  kmap({'o', 'x'}, 'ih', ':<C-u>Gitsigns select_hunk<cr>', { desc = 'Select hunk' })
end

return {
  'lewis6991/gitsigns.nvim',                -- git change markers and various utils to manage changes
  opts = {
    signs = {
      add = { hl = 'GitSignsAdd', text = '+', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
      untracked = { hl = 'GitSignsAdd', text = '∶', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
      change = { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
      delete = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
      topdelete = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
      changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
    },
  },
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'right_align', -- 'eol' | 'overlay' | 'right_align'
    delay = 500,
    ignore_whitespace = true,
  },
  sign_priority = 6,
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'rounded',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1,
  },
  on_attach = keymaps,
}


