local M = {}

M.assert_plug = function(plugname)
  if vim.g.plugs[plugname] then
    return 1
  else
    vim.api.nvim_err_writeln(string.format("Plugin '%s' is not available.", plugname))
    return 0
  end
end

M.toggle_qf = function()
  local qf_open = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win["quickfix"] == 1 then qf_open = true end
  end
  if qf_open then
    vim.cmd("cclose")
  elseif not vim.tbl_isempty(vim.fn.getqflist()) then
    vim.cmd("copen")
  end
end

return M
