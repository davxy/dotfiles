" nvim-tree configuration
"
" https://github.com/kyazdani42/nvim-tree.lua
" https://github.com/kyazdani42/nvim-tree.lua#key-bindings

lua << END
require('nvim-tree').setup {
}
END

nnoremap <F2> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
