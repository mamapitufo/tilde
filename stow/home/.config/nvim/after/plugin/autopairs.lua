if not require("tilde.utils").assert_plug("nvim-autopairs") then
	return
end

local autopairs = require("nvim-autopairs")

autopairs.setup({
	enable_check_bracket_line = false,
})
autopairs.get_rule("'")[1].not_filetypes = { "clojure", "lisp", "scheme", "fennel" }

local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
	vim.api.nvim_err_writeln("Plugin 'cmp' missing for autoparis functionality.")
end

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
