--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

require 'tilde.options'
require 'tilde.keymaps'
require 'tilde.plugin-manager'
require 'tilde.autocommands'

-- vim: ts=2 sts=2 sw=2 et
