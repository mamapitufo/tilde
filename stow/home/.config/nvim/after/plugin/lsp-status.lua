if not require("tilde.utils").assert_plug("lsp-status.nvim") then
	return
end

local lsp_status = require("lsp-status")

lsp_status.status()
lsp_status.register_progress()
lsp_status.config({
	indicator_errors = " ",
	indicator_warnings = "",
	indicator_info = "",
	indicator_hint = "",
	indicator_ok = " ",
	current_function = true,
	diagnostics = false,
	select_symbol = nil,
	update_interval = 100,
	status_symbol = " ",
})
