if not require("tilde.utils").assert_plug("nvim-snippy") then return end

require('snippy').setup({
  mappings = {
    is = {
      ['<c-l>'] = 'expand_or_advance',
      ['<c-h>'] = 'previous',
    }
  }
})
