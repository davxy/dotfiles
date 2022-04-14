"
" Syntastic plugin configuration
"

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1

" C Language
let g:syntastic_c_check_header = 0
let g:syntastic_c_auto_refresh_includes = 1
"let g:syntastic_c_include_dirs = [ 'include', 'src' ]
let g:syntastic_c_config_file = '.syntastic'

" Rust Language
let g:syntastic_rust_checkers = ['check']
