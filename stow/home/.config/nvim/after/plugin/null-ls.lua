if not require("tilde.utils").assert_plug("null-ls.nvim") then return end

local status_ok, typescript_code_actions = pcall(require, "typescript.extensions.null-ls.code-actions")
if not status_ok then vim.api.nvim_err_writeln("Plugin 'typescript.nvim' is expected but not available.") end

local null_ls = require("null-ls")

null_ls.setup({
  should_attach = function(bufnr)
    local cur_ft = vim.bo[bufnr].filetype
    for _, ft in ipairs({
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
    }) do
      if ft == cur_ft then return true end
    end
  end,
  sources = {
    -- formatters
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.stylua,
    -- diagnostics/linters
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.diagnostics.fish,
    -- null_ls.builtins.diagnostics.luacheck,
    null_ls.builtins.diagnostics.stylelint,
    null_ls.builtins.diagnostics.tidy,
    -- code actions
    null_ls.builtins.code_actions.eslint_d,
    typescript_code_actions,
  },
})
