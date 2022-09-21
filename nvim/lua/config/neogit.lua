-- Configuration for 'neogit' plugin.

-- Neogit toggle
utils.nmap("<F7>", ":NeogitToggle<CR>")


local neogit = require('neogit')
neogit.setup()

-- Toggle neogit custom functionality

local neogit_buf_handle = nil

local function neogit_enable()
    if (neogit_buf_handle ~= nil) then
        return
    end
    vim.cmd("Neogit")
    neogit_buf_handle = vim.api.nvim_get_current_buf()
end

local function neogit_disable()
    if (neogit_buf_handle == nil) then
        return
    end

    vim.api.nvim_buf_delete(neogit_buf_handle, {})
    neogit_buf_handle = nil
end

local function neogit_toggle()
    -- check if has been closed via other means
    if (neogit_buf_handle ~= nil and not vim.api.nvim_buf_is_valid(neogit_buf_handle)) then
        neogit_buf_handle = nil
    end

    if (neogit_buf_handle == nil) then
        neogit_enable()
    else
        neogit_disable()
    end
end

vim.api.nvim_create_user_command("NeogitToggle", neogit_toggle, {})
