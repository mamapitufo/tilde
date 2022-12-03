if not require("tilde.utils").assert_plug("prettier.nvim") then return end

require("prettier").setup({
  bin = "prettierd",
  cli_options = {
    semi = false,
    single_quote = true,
    tab_width = 2,
    use_tabs = false,
    trailing_comma = "all",
  },
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  },
})
