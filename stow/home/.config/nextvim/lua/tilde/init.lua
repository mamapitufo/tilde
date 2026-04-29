local M = {}

local function toggle_list(window_name, open_cmd, close_cmd)
  return function()
    local list_open = false
    for _, win in pairs(vim.fn.getwininfo()) do
      if win[window_name] == 1 then
        list_open = true
        break
      end
    end
    if list_open then
      vim.cmd(close_cmd)
    else
      vim.cmd(open_cmd)
    end
  end
end

M.toggle_qflist = toggle_list('quickfix', 'copen', 'cclose')
M.toggle_loclist = toggle_list('loclist', 'lopen', 'lclose')

return M
