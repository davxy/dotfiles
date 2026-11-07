-- A normal paste of a cut first creates an empty file with the target name, then renames the
-- source onto it. On an rclone mount the empty file is uploaded later over the moved file, so the
-- moved file becomes empty (rclone v1.75.2 VFS bug). This plugin chooses the free name itself,
-- as yazi does (a_1.pdf, docs.v2_1), and moves with `force`, which creates no empty file.

local yanked = ya.sync(function()
	cx.tasks.behavior:reset()
	local files = {}
	for _, file in pairs(cx.yanked) do
		files[#files + 1] = { url = file.url, is_dir = file.cha.is_dir }
	end
	return cx.yanked.is_cut, cx.active.current.cwd, files
end)

local function numbered_name(file, number)
	local url = file.url
	if file.is_dir or not url.ext then
		return url.name .. "_" .. number
	end
	return url.stem .. "_" .. number .. "." .. url.ext
end

local function free_target(cwd, file, chosen)
	local name, number = file.url.name, 0
	while chosen[name] or fs.cha(cwd:join(name), false) do
		number = number + 1
		name = numbered_name(file, number)
	end
	chosen[name] = true
	return cwd:join(name)
end

local function entry()
	local is_cut, cwd, files = yanked()
	if not is_cut then
		return ya.emit("paste", {})
	end

	local chosen = {}
	for _, file in ipairs(files) do
		ya.task("move", { from = file.url, to = free_target(cwd, file, chosen), force = true }):spawn()
	end
	ya.emit("unyank", {})
end

return { entry = entry }
