if not require("tilde.utils").assert_plug("nvim-tree.lua") then return end

require("nvim-tree").setup()

vim.keymap.set("n", "<leader>tt", ":NvimTreeToggle<cr>", { desc = "Toggle file browser" })
vim.keymap.set("n", "<leader>ft", ":NvimTreeFindFile<cr>", { desc = "Select in file browser" })
