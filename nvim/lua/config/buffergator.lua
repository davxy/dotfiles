-- Configuration for 'vim-buffergator' plugin
--
-- * https://github.com/jeetsukumaran/vim-buffergator
-- * https://github.com/jeetsukumaran/vim-buffergator/blob/master/doc/buffergator.txt

-- Buffergator toggle
utils.nmap("<F4>", ":BuffergatorToggle<CR>")

-- Split horizontally
vim.api.nvim_set_var("buffergator_viewport_split_policy", "B")

-- Sort by most recently used
vim.api.nvim_set_var("buffergator_sort_regime", "mru")

-- Display mechanism
vim.api.nvim_set_var("buffergator_display_regime", "basename")

-- Relative paths (only relevant with 'basename' regime
vim.api.nvim_set_var("buffergator_show_full_directory_path", 0)

-- Do not use the default keymaps
vim.api.nvim_set_var("buffergator_suppress_keymaps", 1)

-- Do not close on selection
vim.api.nvim_set_var("buffergator_autodismiss_on_select", 0)
