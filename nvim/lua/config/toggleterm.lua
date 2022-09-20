-- Configuration for 'toggleterm.nvim' plugin
--
-- * https://github.com/akinsho/toggleterm.nvim

require('toggleterm').setup {
    size = function(term)
        if term.direction == "horizontal" then
            return vim.o.lines * 0.25
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.5
        end
    end
}

-- Shortcuts
local function term_open(dir, args)
    local command
    if (args ~= nil and args ~= "") then
        command = "TermExec direction=" .. dir .. " cmd=\"" .. args .. "\""
    else
        command = "ToggleTerm direction=" .. dir
    end
    vim.cmd(command)
end

-- User defined commands
vim.api.nvim_create_user_command("Th", function(info) term_open("horizontal", info.args) end, { nargs = "*" })
vim.api.nvim_create_user_command("Tv", function(info) term_open("vertical", info.args) end, { nargs = "*" })
vim.api.nvim_create_user_command("Tf", function(info) term_open("float", info.args) end, { nargs = "*" })
vim.api.nvim_create_user_command("Tt", function(info) term_open("tab", info.args) end, { nargs = "*" })
vim.api.nvim_create_user_command("T", function(info) term_open("float", info.args) end, { nargs = "*" })

-- Shortcut to switch window
vim.api.nvim_set_keymap("t", "<C-w>", "<C-\\><C-n><C-w>", { noremap = true, silent = true })
