local function map_keys(bufnr)
  local gs = package.loaded.gitsigns

  local function map(mode, l, r, opts)
    opts = opts or {}
    opts.buffer = bufnr
    vim.keymap.set(mode, l, r, opts)
  end

  map('n', ']h', function()
    if vim.wo.diff then return ']h' end
    vim.schedule(function() gs.next_hunk() end)
    return '<Ignore>'
  end, {expr=true})
  map('n', '[h', function()
    if vim.wo.diff then return '[h' end
    vim.schedule(function() gs.prev_hunk() end)
    return '<Ignore>'
  end, {expr=true})

  map({'n', 'v'}, '<leader>ghs', ':Gitsigns stage_hunk<cr>')
  map({'n', 'v'}, '<leader>ghr', ':Gitsigns reset_hunk<cr>')
  map('n', '<leader>ghu', gs.undo_stage_hunk)
  map('n', '<leader>ghp', gs.preview_hunk)
  map('n', '<leader>ghb', function() gs.blame_line{full=true} end)

  map('n', '<leader>gR', gs.reset_buffer)
  map('n', '<leader>ghU', gs.reset_buffer_index)
  map('n', '<leader>ghS', gs.stage_buffer)

  map('n', '<leader>tgh', gs.toggle_linehl)
  map('n', '<leader>tgb', gs.toggle_current_line_blame)
  map('n', '<leader>tgd', gs.toggle_deleted)

  local status_ok, which_key = pcall(require, 'which-key')
  if not status_ok then
    return
  end

  which_key.register({
    ['<leader>'] = {
      ghs = 'Stage hunks',
      ghr = 'Reset hunks to git index',
    },
  }, { mode = 'v' })

  which_key.register {
    [']h'] = 'Next changed hunk',
    ['[h'] = 'Previous changed hunk',
    ['<leader>'] = {
      ghs = 'Stage hunk',
      ghr = 'Reset hunk to git index',
      ghu = 'Unstage hunk',
      ghp = 'Preview hunk',
      ghb = 'Blame current line',

      gR = 'Reset buffer',
      ghU = 'Reset buffer to git index',
      ghS = 'Stage buffer',

      tg = { name = '+git' },
      tgh = 'Highlight changed lines',
      tgb = 'Blame current line',
      tgd = 'Show deleted hunks',
    }
  }
end

require'gitsigns'.setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  keymaps = {
    noremap = true,
    ['o ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
    ['x ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>'
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
    col = 1
  },
  on_attach = map_keys
}

