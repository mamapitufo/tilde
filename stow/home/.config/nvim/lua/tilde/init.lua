local M = {}

function M.has(plugin)
  return require('lazy.core.config').plugins[plugin] ~= nil
end

function M.toggle_qf()
  local qf_open = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win['quickfix'] == 1 then
      qf_open = true
      break
    end
  end
  if qf_open then
    vim.cmd('cclose')
  else
    vim.cmd('copen')
  end
end

return M
