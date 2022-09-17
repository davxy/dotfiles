-- Neovim Configuration
--
-- https://neovim.io/doc/user/api.html

vim.cmd('source ~/.config/nvim/header.vim')

local utils = require('utils')

-------------------------------------------------------------------------------
-- Indentation options
-------------------------------------------------------------------------------

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

-- Disable folded text highlighting
vim.api.nvim_set_hl(0, "Folded", {})

--------------------------------------------------------------------------------
-- Stuff under test
--------------------------------------------------------------------------------

-- Automatically scroll with fractional offset
--vim.g.scrolloff_fraction = 0.35
vim.api.nvim_set_var("scrolloff_fraction", 0.35)

--autocmd BufEnter * call SetRelativePath()
vim.api.nvim_create_autocmd("BufEnter", { pattern = "*", command = ":lua require('utils').set_relative_path()" })

-- Don't show last command
-- (set noshowcmd)
vim.opt.showcmd = false
-- Don't show current mode (already shown by 'lualine' plugin)
-- (set noshowmode)
vim.opt.showmode = false
-- Hide command line (requires neovim 0.8)
-- (set cmdheight=0)
vim.opt.cmdheight = 0

-- Special comment color overwrite (e.g. used for code comments)
-- Not required when using 'treesitter' plugin.
-- vim.api.nvim_set_hl(0, "SpecialComment", { ctermfg = 243 })

--------------------------------------------------------------------------------
-- Plugins configuration
--------------------------------------------------------------------------------

require('config')

-- Enable resize mode by default
utils.resize_mode.enable(false)
