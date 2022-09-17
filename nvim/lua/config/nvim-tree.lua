-- Configuration for 'nvim-tree' plugin.
--
-- * https://github.com/kyazdani42/nvim-tree.lua
-- * https://github.com/kyazdani42/nvim-tree.lua#key-bindings

require('nvim-tree').setup {
    -- update_focused_file = {
    --     enable = true,
    -- }
    view = {
        side = "right"
    }
}

-- Maps for commonly used commands
utils.nmap("<F2>", ":NvimTreeToggle<CR>")
utils.nmap("<F3>", ":NvimTreeFindFile<CR>")
utils.nmap("<leader>r", ":NvimTreeRefresh<CR>")
