"-------------------------------------------------------------------------------
" Custom functions
"-------------------------------------------------------------------------------

" Diff with the saved file version

function! DiffOrig()
    let filetype=&ft
    diffthis
    vnew | r # | normal! 1Gdd
    diffthis
    execute "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction

command! DiffOrig call DiffOrig()

"-------------------------------------------------------------------------------

" " Enable hex mode
" function! HexEditOn()
"     let g:hexmode = 1
"     execute "%!xxd -g1"
" endfunction
"
" " Disable hex mode
" function! HexEditOff()
"     let g:hexmode = 0
"     execute "%!xxd -r"
" endfunction
"
" function! HexEditToggle()
"     if !exists("g:hexmode")
"         let g:hexmode = 1
"     endif
"     if g:hexmode == 1
"         call HexEditOff()
"     else
"         call HexEditOn()
"     endif
" endfunction
"
" command HexEditOn call HexEditOn()
" command HexEditOff call HexEditOff()
" command HexEditToggle call HexEditToggle()

"-------------------------------------------------------------------------------

" Toggle resize mode

let s:ResizeModeEnabled = 0

function! ResizeModeDisable()
    echo 'Resize mode disabled'
    nunmap <Up>
    nunmap <Down>
    nunmap <Left>
    nunmap <Right>
    let s:ResizeModeEnabled = 0
endfunction

function! ResizeModeEnable()
    echo 'Resize mode enabled'
    nnoremap <Up>    :resize +2<CR>
    nnoremap <Down>  :resize -2<CR>
    nnoremap <Left>  :vertical resize -2<CR>
    nnoremap <Right> :vertical resize +2<CR>
    let s:ResizeModeEnabled = 1
endfunction

function! ResizeModeToggle()
  if s:ResizeModeEnabled
    call ResizeModeDisable()
  else
    call ResizeModeEnable()
  endif
endfunction

command! ResizeModeToggle call ResizeModeToggle()

"-------------------------------------------------------------------------------

" Customize diagnostic symbols

lua << END
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
END
