" Configuration for 'vim-buffergator' plugin
"
" - https://github.com/jeetsukumaran/vim-buffergator
" - https://github.com/jeetsukumaran/vim-buffergator/blob/master/doc/buffergator.txt

" Split horizontally
let g:buffergator_viewport_split_policy="B"

" Sort by most recently used
let g:buffergator_sort_regime="mru"

" Display mechanism
let g:buffergator_display_regime="basename"

" Relative paths (only relevant with 'basename' regime
let g:buffergator_show_full_directory_path=0

" Do not use the default keymaps
let g:buffergator_suppress_keymaps=1

" Buffergator toggle
nnoremap <tab> :BuffergatorToggle<cr>
