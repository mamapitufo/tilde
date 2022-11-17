if not require('tilde.utils').assert_plug('nvim-ts-autotag') then return end

require'nvim-treesitter.configs'.setup {
  autotag = {
    enable = true,
  }
}
