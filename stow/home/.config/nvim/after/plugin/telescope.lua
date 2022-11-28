if not require("tilde.utils").assert_plug("telescope.nvim") then
	return
end

require("telescope").setup({
	defaults = {
		file_ignore_patterns = { "node_modules" },
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
		},
	},
	pickers = {
		buffers = {
			sort_lastused = true,
			theme = "dropdown",
			previewer = false,
		},
		find_files = {
			find_command = {
				"rg",
				"--files",
				"--hidden",
				"--smart-case",
				"--glob",
				"!**/.git/*",
			},
		},
	},
})

local function map(mode, l, r, opts)
	opts = opts or {}
	vim.keymap.set(mode, l, r, opts)
end

map("n", "<leader>bb", ":Telescope buffers<cr>", { desc = "Find buffer" })
map(
	"n",
	"<leader>fc",
	":Telescope find_files hidden=true cwd=$HOME/Sandbox/tilde prompt_prefix=\\ ~\\  prompt_title=Sandbox/tilde<cr>",
	{ desc = "Find config file" }
)
map("n", "<leader>ff", ":Telescope find_files hidden=true<cr>", { desc = "Find file" })
map(
	"n",
	"<leader>fg",
	":lua require'tilde.telescope-extras'.git_files_fallback()<cr>",
	{ desc = "Find git-controlled file" }
)
map("n", "<leader>fr", ":Telescope oldfiles<cr>", { desc = "Find recently opened file" })
map("n", "<leader>*", ":Telescope grep_string word_match=-w<cr>", { desc = "Find string under cursor" })
map("n", "<leader>s/", ":Telescope search_history<cr>", { desc = "Find in search history" })
map("n", "<leader>s:", ":Telescope command_history<cr>", { desc = "Find in command history" })
map("n", "<leader>sb", ":Telescope current_buffer_fuzzy_find<cr>", { desc = "Fuzzy find in current buffer" })
map("n", "<leader>sf", ":Telescope live_grep<cr>", { desc = "Grep in project" })
map("n", "<leader>sh", ":Telescope help_tags<cr>", { desc = "Find help" })
map("n", "<leader>gl", ":Telescope git_commits<cr>", { desc = "Git log" })
map("n", "<leader>glb", ":Telescope git_bcommits<cr>", { desc = "Git log for buffer" })
