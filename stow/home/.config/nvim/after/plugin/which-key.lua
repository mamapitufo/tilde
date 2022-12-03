if not require("tilde.utils").assert_plug("which-key.nvim") then return end

local wk = require("which-key")

wk.setup()

wk.register({
  ["<leader>"] = {
    b = { name = "+buffer" },
    d = { name = "+diagnostics" },
    f = { name = "+file" },
    g = { name = "+git" },
    gb = { name = "+blame" },
    gh = { name = "+hunks" },
    l = { name = "+LSP" },
    q = { name = "+quit" },
    s = { name = "+search" },
    t = { name = "+toggle" },
    tg = { name = "+git" },
    w = { name = "+window" },
  },
})
