" Default configuration:
" ttps://github.com/folke/trouble.nvim#%EF%B8%8F-configuration

" Toggle trouble window and move focus to it when opening
nnoremap <F4> :TroubleToggle<CR>

" Key mappings
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>
