local function is_folder_only(path)
	local p = io.popen("ls -l " .. ya.quote(path), "r")
	if p == nil then
		return false
	end
	local num = -1
	local flag = false
	for line in p:lines() do
		num = num + 1
		if num == 1 and line:sub(1, 1) == "d" then
			flag = true
		end
	end
	p:close()
	return num == 1 and flag or false
end

local function get_innermost_directory(path)
	local innermost = path
	local flag = is_folder_only(innermost)
	if flag then
		local dirs = io.popen("ls " .. ya.quote(path), "r")
		if dirs == nil then
			return innermost
		end
		for dir in dirs:lines() do
			innermost = innermost .. "/" .. dir
		end
		dirs:close()
		return get_innermost_directory(innermost)
	end
	return innermost
end

local function extract(archive)
	local filename = archive:match("(.*)%.([^%.]+)$")
	-- Always overwrite files when a file to be unpacked already exists on disk
	-- Always create a containing directory
	os.execute("unar -f -d " .. ya.quote(archive) .. " >/dev/null 2>&1")
	return filename
end

local function is_archive(mime)
	local patterns = {
		"application/zip",
		"application/gzip",
		"application/x-tar",
		"application/x-bzip",
		"application/x-bzip2",
		"application/x-7z-compressed",
		"application/x-rar",
		"application/x-xz",
	}
	for _, pattern in ipairs(patterns) do
		if mime:match(pattern) then
			return true
		end
	end
	return false
end

return {
	entry = function()
		local h = cx.active.current.hovered
		if h == nil then
			return
		end
		if h.cha.is_dir then
			local innermost = get_innermost_directory(tostring(h.url))
			ya.manager_emit("cd", { innermost })
		elseif is_archive(h:mime()) then
			local path = extract(tostring(h.url))
			local innermost = get_innermost_directory(path)
			ya.manager_emit("cd", { innermost })
		else
			ya.manager_emit("open", { hovered = true })
		end
	end,
}
