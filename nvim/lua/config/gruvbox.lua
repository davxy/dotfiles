-- Configuration for 'gruvbox' plugin.
--
-- * https://github.com/ellisonleao/gruvbox

require("gruvbox").setup({
    undercurl = false,
    underline = false,
    bold = false,
    italic = true,
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "", -- can be "hard", "soft" or empty string
    dim_inactive = false,
    transparent_mode = false,
    overrides = {
        Folded = {
            italic = true,
        }
    },
})
