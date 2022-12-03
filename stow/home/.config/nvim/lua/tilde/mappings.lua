local map = vim.keymap.set

map("n", "gp", "`[v`]", { desc = "Select pasted text" })

map("n", "<leader>bN", "<cmd>blast<cr>", { desc = "Last buffer" })
map("n", "<leader>bP", "<cmd>bfirst<cr>", { desc = "First buffer" })
map("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bp", "<cmd>bprev<cr>", { desc = "Previous buffer" })

map("n", "[d", function() vim.diagnostic.goto_prev() end, { desc = "Prev diagnostic" })
map("n", "]d", function() vim.diagnostic.goto_next() end, { desc = "Next diagnostic" })
map("n", "<leader>dq", function() vim.diagnostic.setqflist() end, { desc = "Send diagnostics to Quickfix" })
map("n", "<leader>ds", function() vim.diagnostic.open_float() end, { desc = "Diagnostics for current line" })

map("n", "<leader>fs", "<cmd>update<cr>", { desc = "Save file" })

map("n", "<leader>sc", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })

map("n", "<leader>tb", "<cmd>call ToggleBackground()<cr>", { desc = "Light/Dark background" })
map("n", "<leader>th", "<cmd>set cursorline!<cr>", { desc = "Current line highlight" })
map("n", "<leader>tn", "<cmd>setlocal number!<cr>", { desc = "Line numbers" })
map("n", "<leader>tp", "<cmd>setlocal paste!<cr>", { desc = "Paste mode" })
map("n", "<leader>tq", function() require("tilde.utils").toggle_qf() end, { desc = "Quickfix window" })
map("n", "<leader>tr", "<cmd>setlocal relativenumber!<cr>", { desc = "Relative line numbers" })
map("n", "<leader>ts", "<cmd>set spell!<cr>", { desc = "Spell check" })
map("n", "<leader>tw", "<cmd>setlocal wrap!<cr>", { desc = "Line wrap" })

map("n", "<leader>qQ", "<cmd>qa!<cr>", { desc = "Force quit" })
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Close all windows and quit" })

map("n", "<leader>wk", "<c-w>k", { desc = "Focus above" })
map("n", "<leader>wj", "<c-w>j", { desc = "Focus below" })
map("n", "<leader>wh", "<c-w>h", { desc = "Focus left" })
map("n", "<leader>wl", "<c-w>l", { desc = "Focus right" })
map("n", "<leader>wq", "<c-w>q", { desc = "Close" })
map("n", "<leader>ws", "<c-w>s", { desc = "Split horizontally" })
map("n", "<leader>wv", "<c-w>v", { desc = "Split vertically" })
map("n", "<leader>ww", "<c-w>w", { desc = "Switch windows" })
map("n", "<leader>wx", "<c-w>x", { desc = "Swap with next window" })
map("n", "<leader>w=", "<c-w>=", { desc = "Make all windows the same size" })
map("n", "<leader>wK", ":resize -5<cr>", { desc = "Decrease height" })
map("n", "<leader>wJ", ":resize +5<cr>", { desc = "Increase height" })
map("n", "<leader>wH", "<c-w>5<", { desc = "Decrease width" })
map("n", "<leader>wL", "<c-w>5>", { desc = "Increase width" })
map("n", "<leader>w<bar>", "<c-w><bar>", { desc = "Maximize width" })
