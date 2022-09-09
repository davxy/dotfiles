" Treesitter plugin configuration

lua << EOF

require('nvim-treesitter.configs').setup {
    ensure_installed = {
        "lua",
        "rust",
        "toml",
    },
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting=false,
    },
    indent = {
        enable = true
    },
}

-- Let treesitter trives the fold method
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

EOF
