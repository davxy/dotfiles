"
" References:
" - https://github.com/Phantas0s/.dotfiles/tree/master/nvim
" - https://sharksforarms.dev/posts/neovim-rust
"

let $VIMCONFIG = '/home/davxy/.config/nvim'
"
" Source plugin definition file
source $VIMCONFIG/init-plugins.vim

"------------------------------------------------------------------------------
" Features
"------------------------------------------------------------------------------

" Enable syntax highlighting (by name)
syntax enable

" Friendly color scheme
set background=dark
colorscheme solarized

" Transparent background
hi Normal guibg=NONE ctermbg=NONE

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
set scrolloff=20

" Enable mouse support
set mouse=a

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

" Control the initial size of vim
"set columns=80
set wrapmargin=8

set textwidth=80
set colorcolumn=+1

" Leader key command timeout (leader-key is set by default as '\')
set timeoutlen=300

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
" Useful auto commands
"------------------------------------------------------------------------------

" Remove all trailing spaces in a file before saving
autocmd BufWritePre * :%s/\s\+$//e
" Remove all blank lines at the end of the file
autocmd BufWritePre * :%s/\($\n\s*\)\+\%$//e

" Highlight cursor line
autocmd InsertEnter,InsertLeave * set cul!

"------------------------------------------------------------------------------
" Mappings configuration
"------------------------------------------------------------------------------

" Buffers switching
nmap <C-j> :bp<CR>
nmap <C-k> :bn<CR>

" Close current buffer and open the previous
nmap <leader>q :bp<cr>:bd #<cr>
" Close current buffer and open the previous (drop unsaved changes)
nmap <leader>k :bp<cr>:bd! #<cr>

"-------------------------------------------------------------------------------
" Custom functions
"-------------------------------------------------------------------------------

" Custom Functions
"
" Diff with the saved file version
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

"-------------------------------------------------------------------------------
" Load every plugin additional configs
"-------------------------------------------------------------------------------

for file in split(glob('$VIMCONFIG/pluggedconf/*.vim'), '\n')
    execute 'source' file
endfor
