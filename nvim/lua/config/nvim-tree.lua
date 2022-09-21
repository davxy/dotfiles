-- Configuration for 'nvim-tree' plugin.
--
-- * https://github.com/kyazdani42/nvim-tree.lua
-- * https://github.com/kyazdani42/nvim-tree.lua#key-bindings

vim.g.nvim_tree_auto_close = true

require('nvim-tree').setup {
    sync_root_with_cwd = true,
    -- update_focused_file = {
    --     enable = true,
    -- },
    view = {
        side = "right"
    }
}

-- Maps for commonly used commands
utils.nmap("<F2>", ":NvimTreeToggle<CR>")
utils.nmap("<F3>", ":NvimTreeFindFile<CR>")
utils.nmap("<leader>r", ":NvimTreeRefresh<CR>")
