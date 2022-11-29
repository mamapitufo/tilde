if not require("tilde.utils").assert_plug("vim-fugitive") then
	return
end

local map = vim.keymap.set

map('n', '<leader>gbb', '<cmd>Git blame<cr>', { desc = 'Blame buffer'})
