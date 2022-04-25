"------------------------------------------------------------------------------
" VimPlug
"------------------------------------------------------------------------------

call plug#begin("$VIMCONFIG/plugged")

"-------------------------------------------------------------------------------
" General
"-------------------------------------------------------------------------------

" Git plugin
Plug 'tpope/vim-fugitive'

" NerdTree
Plug 'scrooloose/nerdtree'

" NerdTree git plugin
Plug 'Xuyuanp/nerdtree-git-plugin'

" Fuzzy finder
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

"-------------------------------------------------------------------------------
" Look and Feel
"-------------------------------------------------------------------------------

" Development icons
Plug 'ryanoasis/vim-devicons'

" Syntax highlight in NerdTree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Status and tabline
Plug 'nvim-lualine/lualine.nvim'
"Plug 'vim-airline/vim-airline'

" Icons for statusline
Plug 'kyazdani42/nvim-web-devicons'

" Solarized theme
Plug 'altercation/vim-colors-solarized'

" Center text on screen
Plug 'junegunn/goyo.vim'

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

" Automatic braces closing
"Plug 'jiangmiao/auto-pairs'

" Syntax notificaitons
Plug 'folke/trouble.nvim'

" Code comments shortcuts
Plug 'tpope/vim-commentary'

" Rainbow (different shade of color to paretheses)
Plug 'frazrepo/vim-rainbow'

" Vimspector debugger support
"Plug 'puremourning/vimspector'

" Debugger console support for lldb and gdb
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }

" Official Rust plugin
Plug 'rust-lang/rust.vim'

" To enable more of the features of rust-analyzer, such as inlay hints and more
Plug 'simrat39/rust-tools.nvim'

Plug 'junegunn/limelight.vim'

call plug#end()
