"------------------------------------------------------------------------------
" VimPlug
"------------------------------------------------------------------------------

call plug#begin("~/.config/nvim/plugged")

"-------------------------------------------------------------------------------
" General
"-------------------------------------------------------------------------------

" Library of lua functions used by other plugins
" (diffview.nvim)
Plug 'nvim-lua/plenary.nvim'

" File explorer with git and icons support
Plug 'kyazdani42/nvim-tree.lua'

" Fuzzy finder
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Bookmarks
Plug 'MattesGroeger/vim-bookmarks'

" General buffers management
Plug 'jeetsukumaran/vim-buffergator'

" Easy way to delete buffers
Plug 'Asheq/close-buffers.vim'

" Terminal management
Plug 'akinsho/toggleterm.nvim'

" Syntax highlight and folding
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Better folding management
Plug 'kevinhwang91/nvim-ufo'
Plug 'kevinhwang91/promise-async'

"-------------------------------------------------------------------------------
" Look and Feel
"-------------------------------------------------------------------------------

" Color scheme
Plug 'ellisonleao/gruvbox.nvim'
Plug 'sainnhe/gruvbox-material'
Plug 'folke/tokyonight.nvim'

" Development icons
Plug 'ryanoasis/vim-devicons'

" Status and tabline
Plug 'nvim-lualine/lualine.nvim'

" Icons for statusline
Plug 'kyazdani42/nvim-web-devicons'

" Center text on screen
Plug 'junegunn/goyo.vim'

" Text highlight
Plug 'junegunn/limelight.vim'

" Dynamic scroll offset
Plug 'drzel/vim-scrolloff-fraction'

"-------------------------------------------------------------------------------
" Git
"-------------------------------------------------------------------------------

" Git diff viewer
Plug 'sindrets/diffview.nvim'

" Git plugin
Plug 'tpope/vim-fugitive'

" Git diff in gutter and some hunk utilities
Plug 'lewis6991/gitsigns.nvim'

Plug 'TimUntersberger/neogit'

" Utility to resolve git conflicts
Plug 'akinsho/git-conflict.nvim'

"-------------------------------------------------------------------------------
" Development
"-------------------------------------------------------------------------------

" Collection of common configurations for nvim LSP client
Plug 'neovim/nvim-lspconfig'

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

" Generation status line components from the built-in LSP client
Plug 'nvim-lua/lsp-status.nvim'

" Tag browser, useful if using any kind of ctags.
" With Rust, works with 'universal-ctags'.
Plug 'preservim/tagbar'

" Syntax notificaitons
Plug 'folke/trouble.nvim'

" Code comments shortcuts
Plug 'tpope/vim-commentary'

" Debugger console support for lldb and gdb
Plug 'sakhnik/nvim-gdb'

" Official Rust plugin
Plug 'rust-lang/rust.vim'

" To enable more of the features of rust-analyzer, such as inlay hints and more
Plug 'simrat39/rust-tools.nvim'

call plug#end()
