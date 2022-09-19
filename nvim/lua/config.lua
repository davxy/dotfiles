-- Customize diagnostic symbols

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = false,
    update_in_insert = false,
    severity_sort = false,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Plugins configurations

require('config.nvim-tree')
require('config.lualine')
require('config.bookmarks')
require('config.buffergator')
require('config.toggleterm')
require('config.treesitter')
require('config.nvim-ufo')
require('config.gitsigns')
require('config.neogit')
require('config.git-conflict')
require('config.nvim-gdb')
require('config.lspconfig')
require('config.cmp')
require('config.trouble')
require('config.tagbar')
require('config.rust-tools')
require('config.gruvbox')
