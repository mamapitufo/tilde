if not require("tilde.utils").assert_plug("toggleterm.nvim") then
	return
end

require("toggleterm").setup({})

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
	cmd = "lazygit",
	hidden = true,
	close_on_exit = true,
	dir = "git_dir",
	direction = "float",
	float_opts = { border = "double" },
	on_open = function(term)
		vim.cmd("startinsert!")
		vim.keymap.set("n", "<localleader>q", ":close<cr>", {
			buffer = term.bufnr,
			silent = true,
			desc = "Close LazyGit",
		})
	end,
	on_close = function()
		vim.cmd("startinsert!")
	end,
})

function _lazygit_toggle()
	lazygit:toggle()
end

vim.keymap.set("n", "<leader>gs", ":lua _lazygit_toggle()<cr>", {
	silent = true,
	desc = "Open LazyGit",
})
