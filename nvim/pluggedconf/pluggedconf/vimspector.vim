"------------------------------------------------------------------------------
" Vimspector configuration
"------------------------------------------------------------------------------

let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
"let g:vimspector_enable_mappings = 'HUMAN'
"packadd! vimspector

nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>de :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>

nnoremap <Leader>db :call vimspector#ToggleBreakpoint()<CR>
