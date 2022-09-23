-- Configuration for 'trouble' plugin
--
-- * https://github.com/folke/trouble.nvim#%EF%B8%8F-configuration

-- Toggle trouble window
utils.nmap("<F5>", ":TroubleToggle document_diagnostics<CR>", opts)

-- Other key mappings
utils.nmap("<leader>xx", ":TroubleToggle<CR>")
utils.nmap("<leader>xw", ":TroubleToggle workspace_diagnostics<CR>")
utils.nmap("<leader>xd", ":TroubleToggle document_diagnostics<CR>")
utils.nmap("<leader>xq", ":TroubleToggle quickfix<CR>")
utils.nmap("<leader>xl", ":TroubleToggle loclist<CR>")
utils.nmap("gR", ":TroubleToggle lsp_references<CR>")
