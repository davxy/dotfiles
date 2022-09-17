-- Configuration for 'nvim-ufo' plugin
--
-- * https://github.com/kevinhwang91/nvim-ufo

 -- Using ufo provider need a large fold level value
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Treesitter as a main provider instead
-- Only depend on `nvim-treesitter/queries/filetype/folds.scm`,
-- performance and stability are better than `foldmethod=nvim_treesitter#foldexpr()`
local function provider_sel(bufnr, filetype, buftype)
    return {'treesitter'}
end

require('ufo').setup({
    provider_selector = provider_sel,
    close_fold_kinds = {'imports', 'comment'},
})
