-- Configuration for 'vim-bookmarks' plugin.
--
-- * https://github.com/MattesGroeger/vim-bookmarks

-- Automatically close bookmarks split when jumping to a bookmark
vim.api.nvim_set_var("bookmark_auto_close", 1)

-- Enables/disables automatic saving for bookmarks
vim.api.nvim_set_var("bookmark_auto_save", 1)

-- Save bookmarks per working dir, the folder you opened vim from
vim.api.nvim_set_var("bookmark_save_per_working_dir", 1)

-- Enables/disables warning when clearing all bookmarks
vim.api.nvim_set_var("bookmark_show_warning", 1)
