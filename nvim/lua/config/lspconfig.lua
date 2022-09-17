-- Configuration for integrated LSP client.
--
-- * https://github.com/neovim/nvim-lspconfig/wiki/UI-customization#change-diagnostic-symbols-in-the-sign-column-gutter

-- Code navigation shortcuts
utils.nmap("K", ":lua vim.lsp.buf.hover()<CR>")
utils.nmap("gd", ":lua vim.lsp.buf.definition()<CR>")
utils.nmap("gD", ":lua vim.lsp.buf.implementation()<CR>")
utils.nmap("1gD", ":lua vim.lsp.buf.type_definition()<CR>")
utils.nmap("gr", ":lua vim.lsp.buf.references()<CR>")
utils.nmap("gn", ":lua vim.lsp.buf.rename()<CR>" )

-- All symbols within the document
utils.nmap("g0", ":lua vim.lsp.buf.document_symbol()<CR>")
utils.nmap("gW", ":lua vim.lsp.buf.document_symbol()<CR>")

-- Code actions
utils.nmap("n", "ga", ":lua vim.lsp.buf.code_action()<CR>")

-- Set updatetime for CursorHold
-- 300ms of no cursor movement to trigger CursorHold
vim.api.nvim_set_option("updatetime", 300)

-- Show diagnostic popup on cursor hold
--autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
vim.api.nvim_create_autocmd(
    "CursorHold",
    {
        pattern = "*",
        command = ":lua vim.diagnostic.open_float(nil, { focusable = false })",
    }
)

-- Goto previous/next diagnostic warning/error
utils.nmap("g[", ":lua vim.diagnostic.goto_prev()<CR>")
utils.nmap("g]", ":lua vim.diagnostic.goto_next()<CR>")
