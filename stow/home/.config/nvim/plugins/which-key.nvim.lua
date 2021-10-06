local wk = require('which-key')

wk.setup()

wk.register({
  ['<leader>'] = {
    b = { name = '+buffer' },
    bn = { '<cmd>bnext<cr>', 'Next buffer' },
    bp = { '<cmd>bprevious<cr>', 'Prev buffer' },

    f = { name = '+file' },
    fs = { '<cmd>update<cr>', 'Save file' },

    g = { name = '+git' },
    gh = { name = '+hunks' },

    q = { name = '+quit' },
    qq = { '<cmd>qa<cr>', 'Close all windows and quit' },
    qQ = { '<cmd>qa!<cr>', 'Force quit' },

    s = { name = '+search' },
    sc = { '<cmd>nohlsearch<cr>', 'Clear search highlight' },

    t = { name = '+toggle' },
    tS = { '<cmd>set spell!<cr>', 'Spell check' },
    thh = { '<cmd>setlocal cursorline!<cr>', 'Highlight current line' },
    tl = { '<cmd>setlocal wrap!<cr>', 'Text wrap' },
    tn = { '<cmd>setlocal number!<cr>', 'Line numbers' },
    tnr = { '<cmd>setlocal relativenumber!<cr>', 'Relative numbers' },
    tp = { '<cmd>setlocal paste!<cr>', 'Paste mode' },

    w = { name = '+window' },
    wh = { '<c-w>h', 'Go to window on the left' },
    wj = { '<c-w>j', 'Go to window below' },
    wk = { '<c-w>k', 'Go to window above' },
    wl = { '<c-w>l', 'Go to window on the right' },
    wq = { '<c-w>q', 'Close window' },
    ws = { '<c-w>s', 'Split horizontally' },
    wv = { '<c-w>v', 'Split vertically' },
    ww = { '<c-w>w', 'Switch windows' },
    ['w='] = { '<c-w>=', 'Make all windows the same size' },
    wK = { '<cmd>resize -5<cr>', 'Decrease height' },
    wJ = { '<cmd>resize +5<cr>', 'Increase height' },
    wH = { '<c-w>5<', 'Decrease width' },
    wL = { '<c-w>5>', 'Increase width' },
  },
})

