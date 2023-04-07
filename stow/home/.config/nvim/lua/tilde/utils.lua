local M = {}

M.toggle_qf = function()
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

M.fileinfo = function()
  local data = {}

  local fenc = vim.bo.fenc
  if fenc ~= 'utf-8' then table.insert(data, fenc) end

  local fformat = vim.bo.fileformat
  if fformat ~= 'unix' then table.insert(data, fformat) end

  local ft = (vim.bo.filetype ~= '' and vim.bo.filetype) or '[No ft]'
  table.insert(data, ft)

  return table.concat(data, ', ')
end


return M
