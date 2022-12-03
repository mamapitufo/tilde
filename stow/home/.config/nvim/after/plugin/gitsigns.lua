if not require("tilde.utils").assert_plug("gitsigns.nvim") then return end

local function map_keys(bufnr)
  local gs = package.loaded.gitsigns

  local function map(mode, l, r, opts)
    opts = opts or {}
    opts.buffer = bufnr
    vim.keymap.set(mode, l, r, opts)
  end

  map("n", "]h", function()
    if vim.wo.diff then return "]h" end
    vim.schedule(function() gs.next_hunk() end)
    return "<Ignore>"
  end, {
    expr = true,
    desc = "Next changed hunk",
  })
  map("n", "[h", function()
    if vim.wo.diff then return "[h" end
    vim.schedule(function() gs.prev_hunk() end)
    return "<Ignore>"
  end, {
    expr = true,
    desc = "Previous changed hunk",
  })

  map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<cr>", { desc = "Stage hunk" })
  map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<cr>", { desc = "Reset hunk to git index" })
  map("n", "<leader>ghu", gs.undo_stage_hunk, { desc = "Unstage hunk" })
  map("n", "<leader>ghp", gs.preview_hunk, { desc = "Preview hunk" })
  map("n", "<leader>gbl", gs.blame_line, { desc = "Blame current line" })
  map("n", "<leader>gbc", function() gs.blame_line({ full = true }) end, { desc = "Show current line commit" })

  map("n", "<leader>gr", gs.reset_buffer, { desc = "Reset buffer" })
  map("n", "<leader>gR", gs.reset_buffer_index, { desc = "Reset buffer to git index" })
  map("n", "<leader>ga", gs.stage_buffer, { desc = "Stage buffer" })

  map("n", "<leader>tgh", gs.toggle_linehl, { desc = "Highlight changed lines" })
  map("n", "<leader>tgb", gs.toggle_current_line_blame, { desc = "Blame current line" })
  map("n", "<leader>tgd", gs.toggle_deleted, { desc = "Show deleted hunks" })
end

require("gitsigns").setup({
  signs = {
    add = { hl = "GitSignsAdd", text = "+", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
    untracked = { hl = "GitSignsAdd", text = "∶", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
    change = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    changedelete = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
  },
  keymaps = {
    noremap = true,
    ["o ih"] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
    ["x ih"] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
  },
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "right_align", -- 'eol' | 'overlay' | 'right_align'
    delay = 500,
    ignore_whitespace = true,
  },
  sign_priority = 6,
  preview_config = {
    -- Options passed to nvim_open_win
    border = "rounded",
    style = "minimal",
    relative = "cursor",
    row = 0,
    col = 1,
  },
  on_attach = map_keys,
})
