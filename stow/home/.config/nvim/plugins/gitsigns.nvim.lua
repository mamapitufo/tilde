require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  keymaps = {
    -- Default keymap options
    noremap = true,

    -- navigation
    ['n ]h'] = { expr = true, "&diff ? ']h' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'"},
    ['n [h'] = { expr = true, "&diff ? '[h' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'"},

    -- hunk manipulation
    ['n <leader>ghs'] = '<cmd>lua require"gitsigns".stage_hunk()<cr>',
    ['v <leader>ghs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<cr>',
    ['n <leader>ghu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<cr>',
    ['n <leader>ghr'] = '<cmd>lua require"gitsigns".reset_hunk()<cr>',
    ['v <leader>ghr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<cr>',

    -- display
    ['n <leader>ghp'] = '<cmd>lua require"gitsigns".preview_hunk()<cr>',
    ['n <leader>ghb'] = '<cmd>lua require"gitsigns".blame_line(true)<cr>',
    ['n <leader>tch'] = '<cmd>Gitsigns toggle_linehl<cr>',
    ['n <leader>tcb'] = '<cmd>Gitsigns toggle_current_line_blame<cr>',

    -- buffer
    ['n <leader>gR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
    ['n <leader>ghS'] = '<cmd>lua require"gitsigns".stage_buffer()<CR>',
    ['n <leader>ghU'] = '<cmd>lua require"gitsigns".reset_buffer_index()<CR>',

    -- Text objects
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
