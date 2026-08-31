require("full-border"):setup()
require("folder-rules"):setup()
require("status-user-group"):setup()
require("git"):setup()
-- require("duckdb"):setup()
require("dupes"):setup({
	-- Global settings
	save_op = false, -- Save results to file by default
	-- auto_confirm = true, -- Skip confirmation for apply (use with caution!)

	profiles = {
		-- Interactive mode: recursively scan and display duplicates
		interactive = {
			args = { "-r" },
		},
		-- Apply mode: recursively scan and DELETE duplicates
		apply = {
			args = { "-r", "-N", "-d" },
			save_op = true, -- Save results before deletion
		},
		-- Custom profile example (uncomment to use)
		-- custom = {
		--   args = { "-r", "-s", },  -- Your custom jdupes flags
		-- },
	},
})
require("bunny"):setup({
	hops = {},
	desc_strategy = "path", -- If desc isn't present, use "path" or "filename", default is "path"
	ephemeral = true, -- Enable ephemeral hops, default is true
	tabs = true, -- Enable tab hops, default is true
	notify = false, -- Notify after hopping, default is false
	fuzzy_cmd = "fzf", -- Fuzzy searching command, default is "fzf"
})
