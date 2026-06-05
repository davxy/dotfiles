local function write_cwd_to_file(cwd)
		local output_file = os.getenv("CWD_FILE")
    local file = io.open(output_file, "w")
    if file then
        file:write(cwd .. "\n")
        file:close()
    else
        print("Error: Unable to write to file: " .. output_file)
    end
end

-- Quote a string for safe use as a single shell argument
local function shell_quote(s)
    return "'" .. tostring(s):gsub("'", "'\\''") .. "'"
end

-- Run the zoxide add command for the entered folder
local function update_zoxide(cwd)
    local command = "zoxide add " .. shell_quote(cwd)
    os.execute(command)
end

local function setup()
	ps.sub("cd", function()
		local cwd = cx.active.current.cwd
		write_cwd_to_file(cwd)
		update_zoxide(cwd)
		if cwd:ends_with("Downloads") then
			ya.manager_emit("sort", { "modified", reverse = true, dir_first = false })
		else
			ya.manager_emit("sort", { "alphabetical", reverse = false, dir_first = true })
		end
	end)
end

return { setup = setup }
