local tilde = require 'tilde'

return {
  { -- fuzzy finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    command = 'Telescope',
    version = false,
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
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
        current_buffer_fuzzy_find = {
          theme = 'dropdown',
          winblend = 10,
          previewer = false,
        },
      },
    },
    config = function(_, opts)
      local telescope = require 'telescope'
      telescope.setup(opts)
      pcall(telescope.load_extension, 'fzf')
    end,
    keys = {
      { '<leader>*', ':Telescope grep_string word_match=-w<cr>', desc = 'Find word under cursor' },
      { '<leader>/', ':Telescope current_buffer_fuzzy_find<cr>', desc = 'Fuzzy search buffer' },
      { '<leader>bb', ':Telescope buffers<cr>', desc = 'Find buffer' },
      { '<leader>fc', ':Telescope find_files cwd=$HOME/Sandbox/tilde prompt_prefix=\\ ~\\  prompt_title=Sandbox/tilde<cr>', desc = 'Find config file' },
      { '<leader>ff', ':Telescope find_files<cr>', desc = 'Find file' },
      { '<leader>fg', ':Telescope git_files<cr>', desc = 'Find git-controlled file' },
      { '<leader>fr', ':Telescope oldfiles<cr>', desc = 'Find recently opened file' },
      { '<leader>gl', ':Telescope git_commits<cr>', desc = 'Git log' },
      { '<leader>glb', ':Telescope git_bcommits<cr>', desc = 'Git log (buffer)' },
      { '<leader>s/', ':Telescope search_history<cr>', desc = 'Search history' },
      { '<leader>s:', ':Telescope command_history<cr>', desc = 'Command history' },
      { '<leader>sd', ':Telescope diagnostics<cr>', desc = 'Diagnostics' },
      { '<leader>sh', ':Telescope help_tags<cr>', desc = 'Help tags' },
      { '<leader>sp', ':Telescope live_grep<cr>', desc = 'Grep in project' },
    },
  },
  { -- fuzzy finder algorithm
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },
}
