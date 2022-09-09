" Configuration for 'toggleterm.nvim' plugin
" - https://github.com/akinsho/toggleterm.nvim

lua <<EOF
require('toggleterm').setup {
    size = function(term)
        if term.direction == "horizontal" then
            return vim.o.lines * 0.25
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.5
        end
    end
}
EOF

" Open terminal in a new split in insert mode
" (Old manual mappings)
" command! -nargs=* TT terminal <args>
" command! -nargs=* T below split | exec 'resize' . winheight('.')/2 | terminal <args>
" command! -nargs=* VT split | terminal <args>

" Shortcuts
command! -nargs=* Tt ToggleTerm direction=tab
command! -nargs=* Th ToggleTerm direction=horizontal
command! -nargs=* Tv ToggleTerm direction=vertical
command! -nargs=* Tf ToggleTerm direction=float
command! -nargs=* T TermExec direction=float cmd="<args>"

" Shortcut to switch window
tnoremap <C-w> <C-\><C-n><C-w>

" Terminal settings initialization
"function! TerminalInit()
"    setlocal nonumber
"    setlocal norelativenumber
"    setlocal nobuflisted
"    startinsert
"endfunction
"autocmd TermOpen * call TerminalInit()

" Prevents opening other buffers in window used by terminal and
" set insert mode as soon as we are switching to terminal
"function! TerminalEnter()
"    let curr_name=bufname("%")[0:3]
"    let prev_name=bufname("#")[0:3]
"    if curr_name == "term"
"        startinsert
"    elseif prev_name == "term"
"        buffer #
"    else
"        execute 'cd' . getcwd()
"    endif
"endfunction
"autocmd BufEnter * call TerminalEnter()
