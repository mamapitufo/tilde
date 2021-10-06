require("which-key").register({
  ["<leader>bD"] = { "<cmd>bufdo <cmd>Bdelete<cr>", "Kills all buffers" },
  ["<leader>bd"] = { "<cmd>Bdelete<cr>", "Kills current buffer" },
})
