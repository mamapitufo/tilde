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

local map = vim.api.nvim_set_keymap
local map_opts = { silent = true, noremap = true }
map('v', '<leader>ghs', ':lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<cr>', map_opts)
map('v', '<leader>ghR', ':lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<cr>', map_opts)

map('n', ']h', ':Gitsigns next_hunk<cr>', map_opts)
map('n', '[h', ':Gitsigns prev_hunk<cr>', map_opts)
map('n', '<leader>ghs', ':Gitsigns stage_hunk<cr>', map_opts)
map('n', '<leader>ghu', ':Gitsigns undo_stage_hunk<cr>', map_opts)
map('n', '<leader>ghr', ':Gitsigns reset_hunk<cr>', map_opts)

map('n', '<leader>ghp', ':Gitsigns preview_hunk<cr>', map_opts)
map('n', '<leader>ghb', ':lua require"gitsigns".blame_line(true)<cr>', map_opts)

map('n', '<leader>tgh', ':Gitsigns toggle_linehl<cr>', map_opts)
map('n', '<leader>tgb', ':Gitsigns toggle_current_line_blame<cr>', map_opts)

map('n', '<leader>gR', ':Gitsigns reset_buffer<cr>', map_opts)
map('n', '<leader>ghU', ':Gitsigns reset_buffer_index<cr>', map_opts)
map('n', '<leader>ghS', ':Gitsigns stage_buffer<cr>', map_opts)

require'which-key'.register({
  ['<leader>'] = {
    ghS = 'Stage hunks',
    ghR = 'Reset hunks to git index',
  },
}, { mode = 'v' })

require'which-key'.register {
  [']h'] = 'Next changed hunk',
  ['[h'] = 'Previous changed hunk',
  ['<leader>'] = {
    ghs = 'Stage hunk',
    ghu = 'Unstage hunk',
    ghr = 'Reset hunk to git index',

    ghp = 'Preview hunk',
    ghb = 'Blame current line',

    tg = { name = '+git' },
    tgh = 'Highlight changed lines',
    tgb = 'Blame current line',

    gR = 'Reset buffer',
    ghS = 'Stage buffer',
    ghU = 'Reset buffer to git index',
  }
}
