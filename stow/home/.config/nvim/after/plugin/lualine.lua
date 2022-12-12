if not require("tilde.utils").assert_plug("lualine.nvim") then return end

local function fileinfo()
  local data = {}

  local fenc = vim.bo.fenc
  if fenc ~= "utf-8" then table.insert(data, fenc) end

  local fformat = vim.bo.fileformat
  if fformat ~= "unix" then table.insert(data, fformat) end

  local ft = (vim.bo.filetype ~= "" and vim.bo.filetype) or "[No ft]"
  table.insert(data, ft)

  return table.concat(data, ", ")
end

require("lualine").setup({
  options = {
    section_separators = "",
    component_separators = "",
    theme = "zenbones",
    disabled_filetypes = { "NvimTree", "vim-plug" },
  },
  sections = {
    lualine_b = {
      { "branch", icon = "" },
      "diff",
    },
    lualine_c = {
      { "filename", path = 1 },
    },
    lualine_x = {
      {
        "diagnostics",
        sources = { "nvim_diagnostic", "nvim_lsp" },
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
