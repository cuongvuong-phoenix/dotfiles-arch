local saved_sort = {}

local function setup()
	ps.sub("cd", function()
		local tab = cx.active
		-- Index-based is very prone to bugs but we accept it as
		-- 	Yazi doesn't have any unique identifier for a tab...
		local key = cx.tabs.idx
		local sort = saved_sort[key]
		local in_downloads = tab.current.cwd:ends_with("Downloads")

		if in_downloads and not sort then
			local pref = tab.pref
			saved_sort[key] = {
				pref.sort_by,
				reverse = pref.sort_reverse,
				dir_first = pref.sort_dir_first,
				sensitive = pref.sort_sensitive,
				translit = pref.sort_translit,
			}

			ya.emit("sort", { "mtime", reverse = true, dir_first = false })
		elseif not in_downloads and sort then
			ya.emit("sort", sort)
			saved_sort[key] = nil
		end
	end)
end

return { setup = setup }
