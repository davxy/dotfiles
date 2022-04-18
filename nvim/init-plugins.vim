"------------------------------------------------------------------------------
" VimPlug
"------------------------------------------------------------------------------

call plug#begin("$VIMCONFIG/plugged")

"---------
" General
"---------

"" Git plugin
Plug 'tpope/vim-fugitive'
"" Git plugin to view diff
"Plug 'gitgutter/Vim'
"" NerdTree
Plug 'scrooloose/nerdtree'
" NerdTree git plugin
Plug 'Xuyuanp/nerdtree-git-plugin'
" Fuzzy finder
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

"--- Development

" Collection of commong configurations for nvim LSP client
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
"" To enable more of the features of rust-analyzer, such as inlay hints and more!
Plug 'simrat39/rust-tools.nvim'
"" Snippet engine
Plug 'hrsh7th/vim-vsnip'

"" tag browser, useful if using any kind of ctags.
"Plug 'majutsushi/tagbar'
" Automatic closing
Plug 'jiangmiao/auto-pairs'
" Syntax
Plug 'vim-syntastic/syntastic'
" Rust
Plug 'rust-lang/rust.vim'
" Code comments
"Plug 'tpope/vim-commentary'
" Rainbow (different shade of color to paretheses)
Plug 'frazrepo/vim-rainbow'
" Vimspector debugger support
Plug 'puremourning/vimspector'
"
""--- Look and Feel
" Development icons
Plug 'ryanoasis/vim-devicons'
" Syntax highlight in NerdTree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Status and tabline
Plug 'vim-airline/vim-airline'
"" Solarized theme
Plug 'altercation/vim-colors-solarized'

call plug#end()
