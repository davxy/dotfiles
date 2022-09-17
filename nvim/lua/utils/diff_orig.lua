--
-- Diff with the saved file version
--

local diff_orig_buf_handle = nil

local function diff_orig_enable()
    if (diff_orig_buf_handle ~= nil) then
        return
    end

    local type = vim.api.nvim_buf_get_option(0, 'filetype')
    vim.cmd("diffthis")
    vim.cmd("botright vnew orig | r # | normal! 1Gdd")
    vim.cmd("diffthis")
    vim.api.nvim_buf_set_option(0, "filetype", type)
    vim.api.nvim_buf_set_option(0, "buftype", "nofile")
    vim.api.nvim_buf_set_option(0, "bufhidden", "wipe")
    vim.api.nvim_buf_set_option(0, "buflisted", false)
    vim.api.nvim_buf_set_option(0, "swapfile", false)
    vim.api.nvim_buf_set_option(0, "readonly", true)
    diff_orig_buf_handle = vim.api.nvim_get_current_buf()
    vim.cmd("wincmd p")
end

local function diff_orig_disable()
    if (diff_orig_buf_handle == nil) then
        return
    end

    vim.api.nvim_buf_delete(diff_orig_buf_handle, {})
    diff_orig_buf_handle = nil
end

local function diff_orig_toggle()
    if (diff_orig_buf_handle == nil) then
        diff_orig_enable()
    else
        diff_orig_disable()
    end
end

vim.api.nvim_create_user_command("DiffOrigToggle", diff_orig_toggle, {})
