if not require("tilde.utils").assert_plug("nvim-lspconfig") then
	return
end

local hoverHandler = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
local signatureHelpHandler = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
local publishDiagnosticsHandler = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	signs = true,
	update_in_insert = true,
	virtual_text = {
		true,
		spacing = 6,
		severity_limit = "Error",
	},
	border = "rounded",
})
local handlers = {
	["textDocument/publishDiagnostics"] = publishDiagnosticsHandler,
	["textDocument/hover"] = hoverHandler,
	["textDocument/signatureHelp"] = signatureHelpHandler,
}

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client, bufnr)
	local map = function(mode, l, r, opts)
		opts = opts or {}
		opts.buffer = bufnr
		vim.keymap.set(mode, l, r, opts)
	end

	map("n", "gd", function()
		vim.lsp.buf.definition()
	end, { desc = "Jump to symbol definition" })
	map("n", "K", function()
		vim.lsp.buf.hover()
	end, { desc = "Show documentation" })

	map("n", "gD", function()
		vim.lsp.buf.declaration()
	end, { desc = "Jump to symbol declaration" })
	map("n", "<leader>lt", function()
		vim.lsp.buf.type_definition()
	end, { desc = "Jump to type def" })
	map("n", "<leader>lk", function()
		vim.lsp.buf.signature_help()
	end, { desc = "Show symbol signature" })
	map("n", "<leader>ln", function()
		vim.lsp.buf.rename()
	end, { desc = "Rename symbol" })
	map("n", "<leader>lf", function()
		vim.lsp.buf.format()
	end, { desc = "Format current buffer" })

	map("n", "<leader>la", function()
		vim.lsp.buf.code_action()
	end, { desc = "Show code actions" })
	map("n", "<leader>lr", function()
		vim.lsp.buf.references()
	end, { desc = "Find references" })
	map("n", "<leader>li", function()
		vim.lsp.buf.implementation()
	end, { desc = "Find implementation" })

	map("v", "<leader>la", function()
		vim.lsp.buf.range_code_action()
	end, { desc = "Show code actions" })

	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = vim.api.nvim_create_augroup("Format", { clear = true }),
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.formatting_seq_sync()
			end,
		})
	end
end

local lsp = require("lspconfig")
lsp.clojure_lsp.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	handlers = handlers,
})

lsp.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	handlers = handlers,
})

lsp.sumneko_lua.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	handlers = handlers,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = { enable = false },
		},
	},
})

lsp.tailwindcss.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	handlers = handlers,
})

vim.keymap.set("n", "<leader>ls", ":LspInfo<cr>", { desc = "LSP status" })
