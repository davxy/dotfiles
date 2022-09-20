-- Neovim Configuration - v0.1.1
--
-- Lua API:
-- * https://neovim.io/doc/user/api.html
--
-- Good Vim configuration references:
-- * https://github.com/Phantas0s/.dotfiles/tree/master/nvim
-- * https://sharksforarms.dev/posts/neovim-rust
-- * https://wikimho.com/us/q/vi/13965/what-is-command-bang-nargs-in-a-vimrc-file
--
-- Output al hightlight groups:
--  :so $VIMRUNTIME/syntax/hitest.vim

local utils = require('utils')

--------------------------------------------------------------------------------
-- Plugins configuration
--------------------------------------------------------------------------------

vim.cmd("source ~/.config/nvim/plugins.vim")
vim.cmd('source ~/.config/nvim/init.d/fzf.vim')
vim.cmd('source ~/.config/nvim/init.d/limelight.vim')

require('config')

--------------------------------------------------------------------------------
-- Main options
--------------------------------------------------------------------------------

-- Allows hiding buffers even though they contain modifications which have not
-- yet been written back to the associated file. Vim will complain if you try
-- to quit without saving, and swap files will keep you safe if your computer
-- crashes
vim.opt.hidden = true

-- Better command line completion.
-- Make use of the "status line" to show possible completions of command line
-- commands, file names, and more.
-- Usage example: ":color <Tab>" will list all the possibilities
vim.opt.wildmenu = true

-- Show partial commands in the last line of the screen
vim.opt.showcmd = true

-- Highlight searches
vim.opt.hlsearch = true

--------------------------------------------------------------------------------
-- Features
--------------------------------------------------------------------------------

-- Enable syntax highlighting (by name)
vim.cmd("syntax enable")

-- Attempt to determine the type of a file based on its name and possibly its
-- contents. Use this to allow intelligent auto-indenting for each filetype,
-- and for plugins that are filetype specific
vim.cmd("filetype indent plugin on")

-- Set 'nocompatible' to ward off unexpected things that your distro might
-- have made, as well as sanely reset options when re-sourcing .vimrc
vim.opt.compatible = false

-- Set UTF-8 encoding
vim.opt.encoding = "utf-8"

-- Keep the cursor in the middle
-- (currently dynamically managed by the 'vim-scrolloff-fraction' plugin)
--vim.opt.scrolloff = 40

-- Enable mouse support
vim.opt.mouse = "a"

--------------------------------------------------------------------------------
-- Appearence
--------------------------------------------------------------------------------

-- Dark mode
vim.opt.background = "dark"

-- Enables 24-bit RGB color in the TUI.
-- Uses "gui" `highlight` attributes instead of "cterm" attributes.
vim.opt.termguicolors = true

-- Set contrast.
-- This configuration option should be placed before `colorscheme gruvbox-material`.
-- Available values: 'hard', 'medium'(default), 'soft'
vim.g.gruvbox_material_background = 'medium'

-- Set color scheme
--vim.cmd("colorscheme gruvbox")
vim.cmd("colorscheme gruvbox-material")
--vim.cmd("colorscheme tokyonight")

-- Cursor settings
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,"..
    "a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,"..
    "sm:block-blinkwait175-blinkoff150-blinkon175"

-- Highlight line under cursor
vim.opt.cursorline = true

--------------------------------------------------------------------------------
-- Usability options
--------------------------------------------------------------------------------

-- When opening a new line and no filetype-specific indenting is enabled, keep
-- the same indent as the line you're currently on. Useful for READMEs, etc.
vim.opt.autoindent = true

-- Display the cursor position on the last line of the screen or in the status
-- line of a window set ruler
vim.opt.ruler = true

-- Display relative line numbers
vim.opt.number = true
vim.opt.rnu = true

-- Color column corresponding to textwidth value
vim.opt.colorcolumn = "+1"

-- Do not automatically add end of line
vim.opt.fixendofline = false

--------------------------------------------------------------------------------
-- Indentation options
--------------------------------------------------------------------------------

-- Hitting tab in insert mode produce the appropriate number of spaces
vim.opt.expandtab = true

-- How many columns a tab counts for. The command affect how existing text is
-- displayed
vim.opt.tabstop = 4

-- How many columns a Tab counts when in insert mode. If softtabstop is less
-- than tabstop and expandtab is not set, vim will use a combination of tabs
-- and spaces to make up the desired spacing.
vim.opt.softtabstop = 4

-- How many columns text is indented with the reindent operations (<< and >>)
-- and automatic C-style indentation
vim.opt.shiftwidth = 4

--------------------------------------------------------------------------------
-- Useful mappings
--------------------------------------------------------------------------------

-- Buffers switching
utils.nmap("<c-j>", ":bp<cr>")
utils.nmap("<c-k>", ":bn<cr>")

-- Close current buffer and open the previous (drop unsaved changes)
utils.nmap("<leader>k", ":bd! %<cr>")
-- Close current buffer and open the previous
utils.nmap("<leader>q", ":bd %<cr>")

-- Split mappings similar to tmux
utils.nmap("<c-w>-", "<esc>:botright new<cr>")
utils.nmap("<c-w>\\", "<esc>:botright vnew<cr>")

--------------------------------------------------------------------------------
-- Folding tweaks
--------------------------------------------------------------------------------

vim.opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.opt.foldcolumn = '1'
vim.opt.foldlevel = 99 -- Using ufo provider need a large value
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

--------------------------------------------------------------------------------
-- Auto commands
--------------------------------------------------------------------------------

-- Control the text width limit by file extension.
-- Rust textwidth is currently controlled by rust plugin
vim.api.nvim_create_autocmd(
    { "BufReadPost", "BufNewFile" },
    { pattern = { "*.c" , "*.cpp", "*.h", "*.hpp", "*.py" }, command = "setlocal textwidth=100" }
)

-- Remove all trailing spaces in a file before saving
vim.api.nvim_create_autocmd(
    "BufWritePre",
    { pattern = "*", command = '%s/\\s\\+$//e' }
)

-- Remove all blank lines at the end of the file
vim.api.nvim_create_autocmd(
    "BufWritePre",
    { pattern = "*", command = "%s/\\($\\n\\s*\\)\\+\\%$//e" }
)

-- Highlight cursor line
-- vim.api.nvim_create_autocmd(
--     { "InsertEnter", "InsertLeave" },
--     { pattern = "*", command = "set cul!" }
-- )

--------------------------------------------------------------------------------
-- Stuff under test
--------------------------------------------------------------------------------

-- Automatically scroll with fractional offset
--vim.g.scrolloff_fraction = 0.35
vim.api.nvim_set_var("scrolloff_fraction", 0.35)

--autocmd BufEnter * call SetRelativePath()
vim.api.nvim_create_autocmd("BufEnter", { pattern = "*", command = ":lua require('utils').set_relative_path()" })

-- Don't show last command
vim.opt.showcmd = false

-- Don't show current mode (already shown by 'lualine' plugin)
vim.opt.showmode = false

-- Hide command line (requires neovim 0.8)
-- TODO: Currently buggy: https://github.com/neovim/neovim/issues/20243
--vim.opt.cmdheight = 0
vim.opt.cmdheight = 1

-- Special comment color overwrite (e.g. used for code comments)
-- Not required when using 'treesitter' plugin.
-- vim.api.nvim_set_hl(0, "SpecialComment", { ctermfg = 243 })

-- Disable folded text highlighting
vim.api.nvim_set_hl(0, "Folded", { italic=true })

-- Enable resize mode by default
utils.resize_mode.enable(false)
