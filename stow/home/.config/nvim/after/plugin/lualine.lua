if not require("tilde.utils").assert_plug("lualine.nvim") then
	return
end

local function lsp_connection()
	if vim.tbl_isempty(vim.lsp.buf_get_clients(0)) then
		return ""
	else
		return ""
	end
end

local function fileinfo()
	local data = {}

	local fenc = vim.bo.fenc
	if fenc ~= "utf-8" then
		table.insert(data, fenc)
	end

	local fformat = vim.bo.fileformat
	if fformat ~= "unix" then
		table.insert(data, fformat)
	end

	local ft = (vim.bo.filetype ~= "" and vim.bo.filetype) or "[No ft]"
	table.insert(data, ft)

	return table.concat(data, ", ")
end

local disable_components = { "help", "gitcommit" }

require("lualine").setup({
	options = {
		section_separators = "",
		component_separators = "",
		theme = "zenbones",
		disabled_filetypes = { "NvimTree", "vim-plug" },
		globalstatus = true,
	},
	sections = {
		lualine_b = {
			{ "branch", icon = "", disabled_filetypes = disable_components },
			{ "diff", disabled_filetypes = disabled_components },
		},
		lualine_c = {
			{ "filename", path = 1 },
		},
		lualine_x = {
			{ "lsp_connection", disabled_filetypes = disabled_components },
			{
				"diagnostics",
				disabled_filetypes = disabled_components,
				sources = { "nvim_lsp" },
				diagnostics_color = {
					error = { fg = "#a8334c" },
					warn = { fg = "#803d1c" },
					info = { fg = "#286486" },
					hint = { fg = "#4f5e68" },
				},
				symbols = { error = "E:", warn = "W:", info = "I:", hint = "H:" },
			},
		},
		lualine_y = { fileinfo },
		lualine_z = {
			{
				"location",
				padding = { left = 1, right = 0 },
			},
			"progress",
		},
	},
	extensions = { "quickfix", "fugitive" },
})
