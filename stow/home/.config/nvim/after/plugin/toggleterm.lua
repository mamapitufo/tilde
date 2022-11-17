if not require('tilde.utils').assert_plug('toggleterm.nvim') then return end

require('toggleterm').setup{}

local map_opts = {
  noremap = true,
  silent = true,
  desc = 'Toggle LazyGit',
}

local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = 'lazygit',
  hidden = true,
  dir = 'git_dir',
  direction = 'float',
  float_opts = { border = 'double', },
  on_open = function (term)
    vim.cmd('startinsert!')
    vim.api.nvim_buf_set_keymap(term.bufnr, 'n', '<localleader>q', ':close<cr>', map_opts)
   end,
  on_close = function (term)
    vim.cmd('startinsert!')
  end
})

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap('n', '<leader>gs', ':lua _lazygit_toggle()<cr>', map_opts)
