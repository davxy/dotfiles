-- Configuration for 'tagbar' plugin.

-- Toggle tagbar and move focus to it when opening
utils.nmap("<F6>", ":TagbarToggle f<CR>")

vim.api.nvim_set_var("rust_use_custom_ctags_defs", 1)

vim.api.nvim_set_var("tagbar_type_rust", {
    ctagsbin = "ctags",
    ctagstype = "rust",
    sro = "::",
    kinds = {
        'n:modules',
        's:structures:1',
        'i:interfaces',
        'c:implementations',
        'f:functions:1',
        'g:enumerations:1',
        't:type aliases:1:0',
        'v:constants:1:0',
        'M:macros:1',
        'm:fields:1:0',
        'e:enum variants:1:0',
        'P:methods:1',
    },
    kind2scope = {
        n = 'module',
        s = 'struct',
        i = 'interface',
        c = 'implementation',
        f = 'function',
        g = 'enum',
        t = 'typedef',
        v = 'variable',
        M = 'macro',
        m = 'field',
        e = 'enumerator',
        P = 'method',
    },
})
