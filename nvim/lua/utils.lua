--
-- Utilities mostly used in neovim and plugins configurations setup
--

-- Command mapping in normal mode with common options.
local function nmap(lhs, rhs)
    local opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap("n", lhs, rhs, opts)
end

-- Check for file existence.
local function file_exists(filename)
    local file = io.open(filename)
    if file ~= nil then
        io.close(file)
        return true
    else
        return false
    end
end

-- Set relative path for buffers.
--
-- Useful for all the plugins that are displaying buffers file path such as
-- buffergator.
local function set_relative_path()
    vim.cmd("cd " .. vim.fn.getcwd())
end

-- Execute a vim Ex command and return to the previous cursor position
local function cmd_and_jump_out(cmd)
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    vim.cmd(cmd)
    vim.api.nvim_win_set_cursor(0, { row, col })
end

--

local M = {
    nmap = nmap,
    file_exists = file_exists,
    set_relative_path = set_relative_path,
    cmd_and_jump_out = cmd_and_jump_out,
    diff_orig = require('utils.diff_orig'),
    resize_mode = require('utils.resize_mode'),
    hex_mode = require('utils.hex_mode'),
}

-- Export utils to the global table
_G.utils = M

return M
