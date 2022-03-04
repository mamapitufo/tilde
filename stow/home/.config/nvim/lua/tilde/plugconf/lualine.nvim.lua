local function fileinfo()
  local data = {}

  local fenc = vim.bo.fenc
  if fenc ~= 'utf-8' then
    table.insert(data, fenc)
  end

  local fformat = vim.bo.fileformat
  if fformat ~= 'unix' then
    table.insert(data, fformat)
  end

  local ft = (vim.bo.filetype ~= '' and vim.bo.filetype) or '[No ft]'
  table.insert(data, ft)

  return table.concat(data, ' | ')
end

require'lualine'.setup {
  options = {
    section_separators = '',
    component_separators = '|',
    theme = 'zenbones',
    disabled_filetypes = { 'help', 'vim-plug', 'gitcommit', 'NvimTree' }
  },
  sections = {
    lualine_b = {
      { 'branch', icon = '' }
    },
    lualine_c = {
      {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        color_error = '#c44756',
        color_warn = '#916d03',
        symbols = { error = 'E:', warn = 'W:', info = 'I:', hint = 'H:' }
      },
      { 'filename', path = 1 }
    },
    lualine_x = { fileinfo }
  },
  extensions = { 'quickfix', 'fugitive' }
}
