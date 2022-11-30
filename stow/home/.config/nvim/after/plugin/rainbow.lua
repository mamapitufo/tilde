if not require("tilde.utils").assert_plug("nvim-ts-rainbow") then
	return
end

require("nvim-treesitter.configs").setup({
	rainbow = {
		enable = true,
		max_file_lines = 1000,
	},
})
