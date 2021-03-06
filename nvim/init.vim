" (Neo)Vim Config - v0.1.0
"
" Good References:
" - https://github.com/Phantas0s/.dotfiles/tree/master/nvim
" - https://sharksforarms.dev/posts/neovim-rust
" - https://wikimho.com/us/q/vi/13965/what-is-command-bang-nargs-in-a-vimrc-file
"
" Output al hightlight groups:
" :so $VIMRUNTIME/syntax/hitest.vim

let $VIMCONFIG='/home/davxy/.config/nvim'

" Source plugin definition file
source $VIMCONFIG/plugins.vim

"------------------------------------------------------------------------------
" Features
"------------------------------------------------------------------------------

" Enable syntax highlighting (by name)
syntax enable

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific
filetype indent plugin on

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Set UTF-8 encoding
set encoding=UTF-8

" Keep the cursor in the middle
" (currently dynamically managed by the 'vim-scrolloff-fraction' plugin)
"set scrolloff=40

" Enable mouse support
set mouse=a

"------------------------------------------------------------------------------
" Appearence
"------------------------------------------------------------------------------

" Friendly color scheme
set background=dark
colorscheme solarized

" Cursor settings
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
    \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
    \,sm:block-blinkwait175-blinkoff150-blinkon175

" Highlight line under cursor
set cursorline

" Transparent background
"hi Normal guibg=NONE ctermbg=NONE

" Gutter colors
highlight SignColumn ctermbg=black ctermfg=grey guibg=black guifg=grey

"------------------------------------------------------------------------------
" Main options
"------------------------------------------------------------------------------

" Allows hiding buffers even though they contain modifications which have not
" yet been written back to the associated file. Vim will complain if you try
" to quit without saving, and swap files will keep you safe if your computer
" crashes
set hidden

" Better command line completion.
" Make use of the "status line" to show possible completions of command line
" commands, file names, and more.
" Usage example: ":color <Tab>" will list all the possibilities
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches
set hlsearch

"------------------------------------------------------------------------------
" Usability options
"------------------------------------------------------------------------------

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Display the cursor position on the last line of the screen or in the status
" line of a window set ruler
set ruler

" Display relative line numbers
set number
set rnu

" Color column corresponding to textwidth value
set colorcolumn=+1

" Do not automatically add end of line
set nofixendofline

" Highlight cursor line
autocmd InsertEnter,InsertLeave * set cul!
"
" Control the text width limit
" Rust textwidth is currently controlled by rust plugin
autocmd BufReadPost,BufNewFile *.c,*.cpp,*.h,*.hpp,*.py setlocal textwidth=100

" Remove all trailing spaces in a file before saving
autocmd BufWritePre * :%s/\s\+$//e

" Remove all blank lines at the end of the file
autocmd BufWritePre * :%s/\($\n\s*\)\+\%$//e

"------------------------------------------------------------------------------
" Indentation options
"------------------------------------------------------------------------------

" Hitting tab in insert mode produce the appropriate number of spaces
set expandtab

" How many columns a tab counts for. The command affect how existing text is
" displayed
set tabstop=4

" How many columns a Tab counts when in insert mode. If softtabstop is less
" than tabstop and expandtab is not set, vim will use a combination of tabs
" and spaces to make up the desired spacing.
set softtabstop=4

" How many columns text is indented with the reindent operations (<< and >>)
" and automatic C-style indentation
set shiftwidth=4

"------------------------------------------------------------------------------
" Useful mappings
"------------------------------------------------------------------------------

" Buffers switching
nmap <C-j> :bp<cr>
nmap <C-k> :bn<cr>
" Close current buffer and open the previous (drop unsaved changes)
nmap <leader>k :bd! %<cr>
" Close current buffer and open the previous
nmap <leader>q :Bdelete this<cr>

"-------------------------------------------------------------------------------
" Custom functions
"-------------------------------------------------------------------------------

" Diff with the saved file version
function! DiffWithSaved()
    let filetype=&ft
    diffthis
    vnew | r # | normal! 1Gdd
    diffthis
    execute "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
command! DiffWithSaved call DiffWithSaved()

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
" Terminal tweaks
"-------------------------------------------------------------------------------

" Open terminal in a new split in insert mode
command! -nargs=* TT terminal <args>
command! -nargs=* T below split | exec 'resize' . winheight('.')/2 | terminal <args>
command! -nargs=* VT split | terminal <args>

" Terminal settings initialization
function! TerminalInit()
    setlocal nonumber
    setlocal norelativenumber
    setlocal nobuflisted
    startinsert
endfunction
autocmd TermOpen * call TerminalInit()

" Prevents opening other buffers in window used by terminal and
" set insert mode as soon as we are switching to terminal
function! TerminalEnter()
    let curr_name=bufname("%")[0:3]
    let prev_name=bufname("#")[0:3]
    if curr_name == "term"
        startinsert
    elseif prev_name == "term"
        buffer #
    endif
endfunction
autocmd BufEnter * call TerminalEnter()

" Shortcut to enter normal mode
"tnoremap <esc> <C-\><C-n>
" Shortcut to switch window
tnoremap <C-w> <C-\><C-n><C-w>

"-------------------------------------------------------------------------------
" Load every plugin additional configs
"-------------------------------------------------------------------------------

for file in split(glob('$VIMCONFIG/init.d/*.vim'), '\n')
    execute 'source' file
endfor

"-------------------------------------------------------------------------------
" Stuff under test
"-------------------------------------------------------------------------------

" Transparecy for neovide
let g:neovide_transparency=0.9

" Automatically scroll with fractional offset
let g:scrolloff_fraction = 0.35

" Special comment color overwrite (e.g. used by Rust documentation)
hi SpecialComment ctermfg=243

" Split mappings similar to tmux
noremap <C-w>- <esc>:new<cr>
noremap <C-w>\ <esc>:vnew<cr>

let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
