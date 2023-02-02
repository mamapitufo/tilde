if not require("tilde.utils").assert_plug("nvim-treesitter") then return end

require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "clojure",
    "css",
    "fish",
    "graphql",
    "html",
    "javascript",
    "json",
    "jsonc",
    "json5",
    "lua",
    "rasi",
    "scss",
    "tsx",
    "typescript",
    "toml",
    "vim",
    "yaml",
  },
  highlight = { enable = true },
  indent = { enable = true },
})
