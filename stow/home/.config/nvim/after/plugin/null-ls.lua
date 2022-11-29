if not require("tilde.utils").assert_plug("null-ls.nvim") then
	return
end

local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.diagnostics.fish,
	},
})
