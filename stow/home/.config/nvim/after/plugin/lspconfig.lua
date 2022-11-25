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

	map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { desc = "Jump to symbol definition" })
	map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", { desc = "Show documentation" })

	map("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", { desc = "Jump to symbol declaration" })
	map("n", "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", { desc = "Jump to type def" })
	map("n", "<leader>lk", "<cmd>lua vim.lsp.buf.signature_help()<cr>", { desc = "Show symbol signature" })
	map("n", "<leader>ln", "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = "Rename symbol" })
	map("n", "<leader>==", "<cmd>lua vim.lsp.buf.formatting()<cr>", { desc = "Format current buffer" })

	map("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "Show code actions" })
	map("n", "<leader>le", "<cmd>Telescope diagnostics bufnr=0<cr>", { desc = "Show diagnostics" })
	map("n", "<leader>lr", "<cmd>Telescope lsp_references<cr>", { desc = "Find references" })
	map("n", "<leader>li", "<cmd>Telescope lsp_implementations<cr>", { desc = "Find implementations" })

	map("v", "<leader>la", "<cmd>lua vim.lsp.buf.range_code_action()<cr>", { desc = "Show code actions" })

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

vim.keymap.set("n", "<leader>l?", ":LspInfo<cr>", { desc = "Show status for buffer" })
