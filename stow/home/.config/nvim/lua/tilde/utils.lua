local M = {}

M.assert_plug = function(plugname)
  if (vim.g.plugs[plugname])
    return 1
  else
    nvim_err_write(string.format("Plugin '%s' is not available.", plugname))
    return 0
  end
end

return M
