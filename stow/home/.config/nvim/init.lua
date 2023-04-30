-- NOTE: these must happen before any plugins load
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

vim.o.termguicolors = true

-- Install package manager (https://github.com/folke/lazy.nvim)
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('tilde.plugins', {
  install = {
    colorscheme = { 'zenbones', 'habamax' },
  },
})

require 'tilde.options'
require 'tilde.keymaps'
require 'tilde.autocommands'

-- vim: ts=2 sts=2 sw=2 et
