local selected_or_hovered = ya.sync(function()
	local tab = cx.active
	local hash = {}
	local arr = {}

	local function add_url(file)
		local url = file.cha.is_dir and file.url or file.url.parent

		if url then
			url = tostring(url)
			if not hash[url] then
				hash[url] = true
				arr[#arr + 1] = url
			end
		end
	end

	-- Prioritize selected over hovered
	for _, file in pairs(tab.selected) do
		add_url(file)
	end

	if #arr == 0 and tab.current.hovered then
		add_url(tab.current.hovered)
	end

	return arr
end)

local function notify(content, level)
	ya.notify({
		title = "zoxide-extras",
		content = content,
		timeout = 3,
		level = level or "info",
	})
end

return {
	entry = function(_, job)
		local action = job.args[1]
		local args = {}

		if action == "add" then
			local score = tonumber(job.args[2]) or 1

			args = { "add", "--score", tostring(score) }
		elseif action == "remove" then
			args = { "remove" }
		else
			return notify("Unknown action: " .. tostring(action), "error")
		end

		local urls = selected_or_hovered()
		if #urls == 0 then
			return notify("No item selected or hovered", "error")
		end

		for _, url in ipairs(urls) do
			args[#args + 1] = url
		end

		local status, err = Command("zoxide"):arg(args):status()
		if not status or not status.success then
			return notify("Command failed: " .. tostring(err or status.code), "error")
		end

		local message = action == "add"
				and string.format("Updated rank for %d director%s", #urls, #urls == 1 and "y" or "ies")
			or string.format("Removed %d director%s from database", #urls, #urls == 1 and "y" or "ies")

		notify(message)
	end,
}
