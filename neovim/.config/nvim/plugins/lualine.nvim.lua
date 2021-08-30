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
    icons_enabled = false,
    section_separators = '',
    component_separators = '|',
    theme = 'solarized_light',
    disabled_filetypes = { 'help', 'vim-plug', 'gitcommit' }
  },
  sections = {
    lualine_b = {
      { 'branch', icons_enabled = true }
    },
    lualine_c = {
      {
        'diagnostics',
        sources = { 'nvim_lsp', 'ale' },
        color_error = '#c44756',
        color_warn = '#916d03',
        color_info = '#0075c9',
        color_hint = '#1f8332'
      },
      { 'filename', path = 1 }
    },
    lualine_x = { fileinfo }
  },
  extensions = { 'quickfix', 'fugitive' }
}
