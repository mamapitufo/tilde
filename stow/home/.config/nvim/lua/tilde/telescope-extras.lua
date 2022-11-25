local M = {}
M.git_files_fallback = function()
	local ok = pcall(require("telescope.builtin").git_files, {})
	if not ok then
		require("telescope.builtin").find_files({})
	end
end

return M
