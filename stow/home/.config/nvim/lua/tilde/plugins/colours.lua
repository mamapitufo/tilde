return {
  {
    'mcchrish/zenbones.nvim',               -- Minimal themes
    dependencies = { 'rktjmp/lush.nvim' },
    priority = 1000,
    config = function()
      vim.g.zenbones_lightness = 'bright'
      vim.g.zenbones_solid_vert_split = true
      vim.g.zenbones_solid_float_border = true

      vim.o.background = 'light'
      vim.cmd.colorscheme 'zenbones'
    end,
  }
}
