" Configure LSP through rust-tools.nvim plugin.
"
" rust-tools will configure and enable certain LSP features for us.
"
" See https://github.com/simrat39/rust-tools.nvim#configuration

highlight InlayHintsColor ctermfg=59 guifg=#41535b

lua <<EOF

local nvim_lsp = require'lspconfig'

-- All the settings to send to nvim-lspconfig.
-- These override the defaults set by rust-tools.nvim.
-- See https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
local settings = {
    -- to enable rust-analyzer settings visit:
    -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
    ["rust-analyzer"] = {
        -- enable clippy on save
        checkOnSave = {
            command = "check",
            extraArgs = { "--target-dir", "target/rust-analyzer" },
        },
    }
}

-- [WiP] Attempt to create a local configuration file to overwrite the defaults
-- local my_config = require('/home/davxy/myconfig.lua')
-- mycond.get_lsp_config()
-- print(settings["rust-analyzer"].checkOnSave.command)

local opts = {
    -- overwrite default options
    tools = {
        inlay_hints = {
            parameter_hints_prefix = " ◁ ",
            other_hints_prefix = " ▶ ",
            -- The color of the hints
            highlight = "InlayHintsColor",
        },
    },

    server = {
        settings = settings,
    },
}

require('rust-tools').setup(opts)

EOF
