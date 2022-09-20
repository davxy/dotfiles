-- Configuration for 'limelight' plugin

-- Apply limelight when on goyo actions
vim.api.nvim_create_autocmd("User", { pattern = "GoyoEnter", command = "Limelight" })
vim.api.nvim_create_autocmd("User", { pattern = "GoyoLeave", command = "Limelight!" })

-- Color name (:help cterm-colors) or ANSI code
vim.g.limelight_conceal_ctermfg = 'gray'
vim.g.limelight_conceal_ctermfg = 240

-- Color name (:help gui-colors) or RGB color
vim.g.limelight_conceal_guifg = 'DarkGray'
vim.g.limelight_conceal_guifg = '#777777'
