"
" FZF configuration
"

augroup fzf
  autocmd!
augroup END

" Fuzzy finder
nnoremap <C-f> :Files<CR>
nnoremap <C-g> :Rg<CR>

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options

" ripgrep command to search in multiple files
" autocmd fzf VimEnter * command! -nargs=* Rg call fzf#vim#grep(
"   \   'rg --column --line-number --no-heading --fixed-strings --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1,
"   \   <bang>0 ? fzf#vim#with_preview('up:60%')
"   \           : fzf#vim#with_preview('right:50%:hidden', '?'),
"   \   <bang>0)

" " ripgrep command to search in multiple files (ignore case)
" autocmd fzf VimEnter * command! -nargs=* Rgi call fzf#vim#grep(
"   \   'rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1,
"   \   <bang>0 ? fzf#vim#with_preview('up:60%')
"   \           : fzf#vim#with_preview('right:50%:hidden', '?'),
"   \   <bang>0)
