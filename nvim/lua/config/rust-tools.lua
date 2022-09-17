-- Configuration for 'rust-tools' plugin.
--
-- rust-tools will configure and enable certain LSP features for us.
--
-- * https://github.com/simrat39/rust-tools.nvim#configuration
--
-- Color for inline hints fetched via LSP lighlight InlayHintsColor ctermfg=59 guifg=#41535b

-- Check dependency is satisfied
local nvim_lsp = require('lspconfig')

-- All the settings to send to nvim-lspconfig.
--
-- These override the defaults set by rust-tools.nvim.
-- See https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
local server_settings = {
    ["rust-analyzer"] = {
        -- Enable check on save
        checkOnSave = {
            command = "check",
            -- Output in a different directory to prevent target dir lock
            extraArgs = { "--target-dir", "target/rust-analyzer" },
        },
    }
}

-- [WiP] Attempt to create a local configuration file to overwrite the defaults
-- local my_config = require('/home/davxy/myconfig.lua')
-- mycond.get_lsp_config()
-- print(settings["rust-analyzer"].checkOnSave.command)

vim.api.nvim_set_hl(0, "InlayHintsColor", { ctermfg = 59 })

local opts = {
    -- Overwrite default options
    tools = {
        inlay_hints = {
            parameter_hints_prefix = " ◁ ",
            other_hints_prefix = " ▶ ",
            -- The color of the hints
            highlight = "InlayHintsColor",
        },
    },

    server = {
        settings = server_settings,
    },
}

require('rust-tools').setup(opts)
