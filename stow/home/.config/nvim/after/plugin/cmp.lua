if not require("tilde.utils").assert_plug("nvim-cmp") then return end

local cmp = require("cmp")

cmp.setup({
  completion = {
    autocomplete = false
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "conjure" },
    { name = "snippy" },
    { name = "path" },
    { name = "buffer" },
  }),
  formatting = {
    format = function(entry, vim_item)
      vim_item.menu = ({
        buffer = "[buff]",
        conjure = "[conj]",
        snippy = "[snip]",
        nvim_lsp = "[lsp]",
        path = "[path]",
      })[entry.source.name]
      return vim_item
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
    ["<C-space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<cr>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
  }),
  snippet = {
    expand = function(args)
      local status_ok, snippy = pcall(require, "snippy")
      if not status_ok then return end

      snippy.expand_snippet(args.body)
    end,
  },
})
