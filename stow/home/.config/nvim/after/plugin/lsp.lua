if not require("tilde.utils").assert_plug("nvim-lspconfig") then return end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
vim.lsp.handlers["textDocument/publishDiagnostics"] =
vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { border = "rounded" })

vim.diagnostic.config({
  signs = true,
  -- 	XXX not sure if this is needed for autotags...
  -- 	update_in_insert = true,
  virtual_text = {
    severity = vim.diagnostic.severity.ERROR,
    source = "if_many",
    spacing = 6,
    signs = false,
  },
  float = {
    severity_sort = true,
    source = "if_many",
    border = "rounded",
    header = { "  Line diagnostics", "DiagnosticWarning" },
    prefix = function(diagnostic)
      local diag_to_format = {
        [vim.diagnostic.severity.ERROR] = { "Error", "DiagnosticError" },
        [vim.diagnostic.severity.WARN] = { "Warning", "DiagnosticWarning" },
        [vim.diagnostic.severity.INFO] = { "Info", "DiagnosticInfo" },
        [vim.diagnostic.severity.HINT] = { "Hint", "DiagnosticHint" },
      }
      local res = diag_to_format[diagnostic.severity]
      return string.format("(%s) ", res[1]), res[2]
    end,
  },
  severity_sort = true,
})

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local format_augroup = vim.api.nvim_create_augroup("FormatOnSave", { clear = true })
local format_buff = function(bufnr)
  vim.lsp.buf.format({
    bufnr = bufnr,
    filter = function(client) return client.name ~= "tsserver" end,
  })
end
local format_on_save = function(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = format_augroup,
      buffer = bufnr,
      callback = function() format_buff(bufnr) end,
    })
  end
end

local set_mappings = function(bufnr)
  local map = function(mode, l, r, opts)
    opts = opts or {}
    opts.buffer = bufnr
    vim.keymap.set(mode, l, r, opts)
  end

  map("n", "gd", vim.lsp.buf.definition, { desc = "Jump to symbol definition" })
  map("n", "K", vim.lsp.buf.hover, { desc = "Show documentation" })

  map("n", "gD", vim.lsp.buf.declaration, { desc = "Jump to symbol declaration" })
  map("n", "<leader>lt", vim.lsp.buf.type_definition, { desc = "Jump to type def" })
  map("n", "<leader>lk", vim.lsp.buf.signature_help, { desc = "Show symbol signature" })
  map("n", "<leader>ln", vim.lsp.buf.rename, { desc = "Rename symbol" })
  map("n", "<leader>lf", function() format_buff(bufnr) end, { desc = "Format current buffer" })

  map("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Show code actions" })
  map("n", "<leader>lr", vim.lsp.buf.references, { desc = "Find references" })
  map("n", "<leader>li", vim.lsp.buf.implementation, { desc = "Find implementation" })

  map("v", "<leader>la", vim.lsp.buf.range_code_action, { desc = "Show code actions" })
end

local lsp = require("lspconfig")

lsp.clojure_lsp.setup({
  on_attach = function(client, bufnr)
    set_mappings(bufnr)
    if require("tilde.utils").assert_plug("conjure") then
      vim.keymap.set("n", '<localleader>"', ":ConjureShadowSelect app<cr>", { desc = "CLJS REPL connect" })
    end
    format_on_save(client, bufnr)
  end,
  capabilities = capabilities,
})

-- `typescript.nvim` plugin requires a weird setup...
if require("tilde.utils").assert_plug("typescript.nvim") then
  require("typescript").setup({
    server = {
      on_attach = function(client, bufnr)
        set_mappings(bufnr)
        format_on_save(client, bufnr)
      end,
      capabilities = capabilities,
    },
  })
end

lsp.sumneko_lua.setup({
  on_attach = function(client, bufnr)
    set_mappings(bufnr)
    format_on_save(client, bufnr)
  end,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = { enable = false },
    },
  },
})

lsp.tailwindcss.setup({
  on_attach = function(client, bufnr)
    set_mappings(bufnr)
    format_on_save(client, bufnr)
  end,
  capabilities = capabilities,
})

vim.keymap.set("n", "<leader>ls", ":LspInfo<cr>", { desc = "LSP status" })
