local M = {}

M.assert_plug = function(plugname)
  if (vim.g.plugs[plugname]) then
    return 1
  else
    vim.api.nvim_err_writeln(string.format("Plugin '%s' is not available.", plugname))
    return 0
  end
end

return M
