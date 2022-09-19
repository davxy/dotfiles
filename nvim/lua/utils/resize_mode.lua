-- Toggle resize mode

local resize_mode_enabled = false

local function resize_mode_enable(verbose)
    if (resize_mode_enabled == true) then
        return
    end
    if (verbose == true) then
        print('resize mode: on')
    end
    local opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap("n", "<Up>", ":resize +2<CR>", opts)
    vim.api.nvim_set_keymap("n", "<Down>", ":resize -2<CR>", opts)
    vim.api.nvim_set_keymap("n", "<Left>", ":vertical resize -2<CR>", opts)
    vim.api.nvim_set_keymap("n", "<Right>", ":vertical resize +2<CR>", opts)
    resize_mode_enabled = true
end

local function resize_mode_disable(verbose)
    if (resize_mode_enabled == false) then
        return
    end
    if (verbose == true) then
        print('resize mode: off')
    end
    vim.api.nvim_del_keymap("n", "<Up>")
    vim.api.nvim_del_keymap("n", "<Down>")
    vim.api.nvim_del_keymap("n", "<Left>")
    vim.api.nvim_del_keymap("n", "<Right>")
    resize_mode_enabled = false
end

local function resize_mode_toggle()
    if (resize_mode_enabled == false) then
        resize_mode_enable(true)
    else
        resize_mode_disable(true)
    end
end

vim.api.nvim_create_user_command("ResizeModeToggle", resize_mode_toggle, {})

local M = {
    enable = resize_mode_enable,
    disable = resize_mode_disable,
    toggle = resize_mode_toggle,
}

return M
