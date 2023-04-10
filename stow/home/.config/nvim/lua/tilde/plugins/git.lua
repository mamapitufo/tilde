return {
  -- git change markers and various utils to manage changes
  {
    'lewis6991/gitsigns.nvim',
    events = { 'BufReadPre', 'BufNewFile' },
    opts = {
      signs = {
        add = { text = '+' },
        untracked = { text = '∶' },
        change = { text = '│' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
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
    on_attach = function(buffer)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
      end

      map('n', ']h', gs.next_hunk, 'Next hunk')
      map('n', '[h', gs.prev_hunk, 'Prev hunk')
      map({ 'n', 'v' }, '<leader>ghs', ':Gitsigns stage_hunk<cr>', 'Stage hunk')
      map({ 'n', 'v' }, '<leader>ghr', ':Gitsigns reset_hunk<cr>', 'Reset hunk to git index')
      map('n', '<leader>ghu', gitsigns.undo_stage_hunk, 'Unstage hunk')
      map('n', '<leader>ghp', gitsigns.preview_hunk, 'Preview hunk')
      map('n', '<leader>gbl', gitsigns.blame_line, 'Blame current line')
      map('n', '<leader>gbc', function() gitsigns.blame_line({ full = true }) end, 'Show current line commit')

      map('n', '<leader>gr', gitsigns.reset_buffer, 'Reset buffer')
      map('n', '<leader>gR', gitsigns.reset_buffer_index, 'Reset buffer to git index')
      map('n', '<leader>ga', gitsigns.stage_buffer, 'Stage buffer')

      map('n', '<leader>tgh', gitsigns.toggle_linehl, 'Highlight changed lines')
      map('n', '<leader>tgb', gitsigns.toggle_current_line_blame, 'Blame current line')
      map('n', '<leader>tgd', gitsigns.toggle_deleted, 'Show deleted hunks')

      map({'o', 'x'}, 'ih', ':<C-u>Gitsigns select_hunk<cr>', 'Select hunk')
    end,
  },
}


