if not require("tilde.utils").assert_plug("mini.nvim") then return end

-- bufremove
local bufremove = require("mini.bufremove")
bufremove.setup({})
vim.keymap.set("n", "<leader>bq", bufremove.delete, {
  silent = true,
  desc = "Close buffer",
})
vim.keymap.set("n", "<leader>bd", bufremove.wipeout, {
  silent = true,
  desc = "Wipeout buffer",
})

-- comment
require("mini.comment").setup({
  hooks = {
    pre = function() require("ts_context_commentstring.internal").update_commentstring({}) end,
  },
})

-- surround
require("mini.surround").setup({})
