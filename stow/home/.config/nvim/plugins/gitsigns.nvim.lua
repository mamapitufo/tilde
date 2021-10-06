require('gitsigns').setup {
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
    delay = 700,
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
}

require('which-key').register({
  ['<leader>'] = {
    ghS = { '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<cr>', 'Stage hunks' },
    ghR = { '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<cr>', 'Reset hunks to git index' }
  },
}, { mode = 'v' })

require('which-key').register({
  [']h'] = { '<cmd>Gitsigns next_hunk<cr>', 'Next changed hunk' },
  ['[h'] = { '<cmd>Gitsigns prev_hunk<cr>', 'Previous changed hunk' },
  ['<leader>'] = {
    ghs = { '<cmd>Gitsigns stage_hunk<cr>', 'Stage hunk' },
    ghu = { '<cmd>Gitsigns undo_stage_hunk<cr>', 'Unstage hunk' },
    ghr = { '<cmd>Gitsigns reset_hunk<cr>', 'Reset hunk to git index' },

    ghp = { '<cmd>Gitsigns preview_hunk<cr>', 'Preview hunk' },
    ghb = { '<cmd>lua require"gitsigns".blame_line(true)<cr>', 'Blame current line' },

    tg = { name = '+git' },
    tgh = { '<cmd>Gitsigns toggle_linehl<cr>', 'Highlight changed lines' },
    tgb = { '<cmd>Gitsigns toggle_current_line_blame<cr>', 'Blame current line' },

    gR = { '<cmd>Gitsigns reset_buffer<cr>', 'Reset buffer' },
    ghS = { '<cmd>Gitsigns stage_buffer<cr>', 'Stage buffer' },
    ghU = { '<cmd>Gitsigns reset_buffer_index<cr>', 'Reset buffer to git index' },
  }
})
