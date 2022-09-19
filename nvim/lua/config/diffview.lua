-- Configuration for 'diffview.nvim' plugin
--
-- * https://github.com/sindrets/diffview.nvim
-- * https://github.com/sindrets/diffview.nvim/blob/main/doc/diffview.txt

require("diffview.actions")
require("diffview").setup({
    file_panel = {
        win_config = {
            position = "bottom",
            height = 35,
        }
    }
})
