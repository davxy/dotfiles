-- Configuration for 'nvim-gdb' plugin.

local utils = require("utils")

-- Auto load lldb initialization script (if present)
function lldb_start(args)
    local cmd = "GdbStartLLDB rust-lldb"
    -- Project init files
    local init_files = { ".lldb.init", "lldb.init" }
    for _, file in ipairs(init_files) do
       if utils.file_exists(file) then
           cmd = cmd .. " --source " .. file
           break
       end
    end
    cmd = cmd .. " " .. args
    vim.api.nvim_command(cmd)
end

-- lldb_start shortcut
vim.api.nvim_create_user_command("Debug", function(info) lldb_start(info.args) end, { nargs = "*"})
