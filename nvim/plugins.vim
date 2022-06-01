"------------------------------------------------------------------------------
" VimPlug
"------------------------------------------------------------------------------

call plug#begin("$VIMCONFIG/plugged")

"-------------------------------------------------------------------------------
" General
"-------------------------------------------------------------------------------

" Git plugin
Plug 'tpope/vim-fugitive'

" Git diff in gutter
Plug 'airblade/vim-gitgutter'

" File explorer with git and icons support
Plug 'kyazdani42/nvim-tree.lua'

" Fuzzy finder
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Bookmarks
Plug 'MattesGroeger/vim-bookmarks'

" Easy buffers management
Plug 'Asheq/close-buffers.vim'

"-------------------------------------------------------------------------------
" Look and Feel
"-------------------------------------------------------------------------------

" Development icons
Plug 'ryanoasis/vim-devicons'

" Status and tabline
Plug 'nvim-lualine/lualine.nvim'

" Icons for statusline
Plug 'kyazdani42/nvim-web-devicons'

" Solarized theme
Plug 'altercation/vim-colors-solarized'

" Center text on screen
Plug 'junegunn/goyo.vim'

" Text highlight
Plug 'junegunn/limelight.vim'

" Dynamic scroll offset
Plug 'drzel/vim-scrolloff-fraction'

"-------------------------------------------------------------------------------
" Development
"-------------------------------------------------------------------------------

" Collection of common configurations for nvim LSP client
Plug 'neovim/nvim-lspconfig'

" Generation status line components from the built-in LSP client
Plug 'nvim-lua/lsp-status.nvim'

" Completion framework
Plug 'hrsh7th/nvim-cmp'

" LSP completion source for nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'

" Snippet completion source for nvim-cmp
Plug 'hrsh7th/cmp-vsnip'

" Other usefull completion sources
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'

" Snippet engine
Plug 'hrsh7th/vim-vsnip'

" Tag browser, useful if using any kind of ctags.
" With Rust, works with universal-ctags.
Plug 'preservim/tagbar'

" Syntax notificaitons
Plug 'folke/trouble.nvim'

" Code comments shortcuts
Plug 'tpope/vim-commentary'

" Rainbow (different shade of color to paretheses)
Plug 'frazrepo/vim-rainbow'

" Debugger console support for lldb and gdb
Plug 'davxy/nvim-gdb'

" Official Rust plugin
Plug 'rust-lang/rust.vim'

" To enable more of the features of rust-analyzer, such as inlay hints and more
Plug 'simrat39/rust-tools.nvim'

call plug#end()
