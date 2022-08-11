" nvim-tree configuration
"
" https://github.com/kyazdani42/nvim-tree.lua
" https://github.com/kyazdani42/nvim-tree.lua#key-bindings

lua << END
require('nvim-tree').setup {
    -- update_focused_file = {
    --     enable = true,
    -- }
    view = {
        side = "right"
    }
}
END

" Remap commonly used commands
nnoremap <F2> :NvimTreeToggle<CR>
nnoremap <F3> :NvimTreeFindFile<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
