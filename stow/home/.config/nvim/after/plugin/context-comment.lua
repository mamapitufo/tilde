if not require("tilde.utils").assert_plug("nvim-ts-context-commentstring") then return end

require("nvim-treesitter.configs").setup({
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
})
