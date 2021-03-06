" lualine configuration
"
" https://github.com/nvim-lualine/lualine.nvim
" https://github.com/nvim-lualine/lualine.nvim#available-options

lua << END
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '∥', right = '∥'},
    section_separators = { left = '▶', right = '◀'},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {"require'lsp-status'.status()", "require'lsp-status'.register_progress()"},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {'buffers'},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {{'filename', path = 1}},
    lualine_y = {},
    lualine_z = {}
  },
  extensions = {}
}
END
