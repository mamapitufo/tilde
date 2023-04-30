return {
  -- syntax for clojure
  {
    'clojure-vim/clojure.vim',
    ft = 'clojure',
  },
  -- S-Expression handling
  {
    'tpope/vim-sexp-mappings-for-regular-people',
    ft = { 'clojure', 'scheme', 'lisp' },
    dependencies = {
      {
        'guns/vim-sexp',
        ft = { 'clojure', 'scheme', 'lisp' },
        init = function()
          vim.g.sexp_enable_insert_mode_mapping = 0
        end,
      },
    },
  },
  -- conversational software development
  {
    'Olical/conjure',
    ft = { 'clojure', 'fennel', 'scheme', 'lisp' },
    init = function()
      vim.g['conjure#log#hud#width'] = 1.0
      vim.g['conjure#log#hud#anchor'] = 'SE'
      vim.g['conjure#log#wrap'] = true

      vim.g['conjure#highlight#enabled'] = true

      vim.g['conjure#client#clojure#nrepl#connection#auto_repl#enable'] = false

      vim.g['conjure#mapping#doc_word'] = { ',K' }
      vim.g['conjure#mapping#def_word'] = false
    end,
  },
  -- syntax for fennel
  { 'bakpakin/fennel.vim', ft = 'fennel' },
}
