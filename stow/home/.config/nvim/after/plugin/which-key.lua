if not require('tilde.utils').assert_plug('which-key.nvim') then return end

local wk = require('which-key')

wk.setup()

wk.register({
  ['[d'] = 'Go to prev diagnostic',
  [']d'] = 'Go to next diagnostic',
  ['gp'] = 'Select pasted text',
  ['<leader>'] = {
    b = { name = '+buffer' },
    bn = 'Next buffer',
    bp = 'Previous buffer',
    bN = 'First buffer',
    bP = 'Last buffer',

    e = { name = '+diagnostics' },
    eq = 'Send diagnostics to quick fix list',
    et = 'Show line diagnostics',

    f = { name = '+file' },
    fs = 'Save file',

    g = { name = '+git' },
    gh = { name = '+hunks' },

    l = { name = '+language' },
    lq = 'Send diagnostics to loclist',

    q = { name = '+quit' },
    qq = 'Close all windows and quit',
    qQ = 'Force quit',

    s = { name = '+search' },
    sc = 'Clear search highlight',

    t = { name = '+toggle' },
    tS = 'Spell check',
    thh = 'Highlight current line',
    tl = 'Text wrap',
    tn = 'Line numbers',
    tr = 'Relative numbers',
    tp = 'Paste mode',
    tb = 'Light/Dark background',

    w = { name = '+window' },
    wh = 'Go to window on the left',
    wj = 'Go to window below',
    wk = 'Go to window above',
    wl = 'Go to window on the right',
    wq = 'Close window',
    ws = 'Split horizontally',
    wv = 'Split vertically',
    ww = 'Switch windows',
    wx = 'Swap window with next',
    ['w='] = 'Make all windows the same size',
    wK = 'Decrease height',
    wJ = 'Increase height',
    wH = 'Decrease width',
    wL = 'Increase width',
    ['w<bar>'] = 'Max width',
  },
})

