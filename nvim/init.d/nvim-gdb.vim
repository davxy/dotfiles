" Nvim-Gdb plugin custom shortcuts

lua <<EOF
local function file_exists(filename)
    local f = io.open(filename)
    if f ~= nil then
        io.close(f)
        return true
    else
        return false
    end
end

-- Auto load lldb initialization script (if present)
function lldb_start(args)
    -- Project init files
    local init_files = { ".lldb.init", "lldb.init" }
    local cmd = "GdbStartLLDB rust-lldb"
    for _, file in ipairs(init_files) do
       if file_exists(file) then
           cmd = cmd .. " --source " .. file
           break
       end
    end
    cmd = cmd .. " " .. args
    vim.api.nvim_command(cmd)
end
EOF

" lldb_start shortcut
command! -nargs=* Debug call luaeval('lldb_start(_A)', <q-args>)
