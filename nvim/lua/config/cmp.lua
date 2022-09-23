-- Configuration for 'nvim-cmp' plugin.
--
-- * https://github.com/hrsh7th/nvim-cmp

-- Set completeopt to have a better completion experience
-- :help completeopt
-- * menuone: popup even when there's only one match
-- * noinsert: Do not insert text until a selection is made
-- * noselect: Do not select, force user to select one from the menu
vim.api.nvim_set_option("completeopt", "menu,menuone,noinsert,noselect")

--Avoid showing extra messages when using completion
local shortmess = vim.api.nvim_get_option("shortmess") .. "c"
vim.api.nvim_set_option("shortmess", shortmess)

local cmp = require('cmp')

-- General setup
cmp.setup({
    -- Enable LSP snippets
    snippet = {
        -- Yyou must specify a snippet engine
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        })
    }),
    -- Installed sources
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
    }, {
        { name = 'buffer' },
    })
})

-- Normal Ex command
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

-- Forward search command
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Backward search command
cmp.setup.cmdline('?', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})
