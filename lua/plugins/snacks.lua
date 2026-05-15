return {
	"folke/snacks.nvim",
	lazy = false,
	opts = {
		dashboard = {
			row = 1,
			preset = {
				keys = {
					{ icon = "\u{f0349} ", key = "f", desc = "Find File", action = ":Telescope find_files" },
					{ icon = "\u{f15c} ", key = "g", desc = "Find Text", action = ":Telescope live_grep" },
					{ icon = "\u{f0c5} ", key = "r", desc = "Recent Files", action = ":Telescope oldfiles" },
					{
						icon = "\u{f013} ",
						key = "c",
						desc = "Config",
						action = ":lua require('telescope.builtin').find_files({ cwd = vim.fn.stdpath('config') })",
					},
					{
						icon = "\u{f04b2} ",
						key = "L",
						desc = "Lazy",
						action = ":Lazy",
						enabled = package.loaded.lazy ~= nil,
					},
					{ icon = "\u{f08b} ", key = "q", desc = "Quit", action = ":qa" },
				},
				header = table.concat({
					" __________________________________________________ ",
					"< Weeks of coding can save you hours of planning. > ",
					" -------------------------------------------------- ",
					"                \\   ^__^                            ",
					"                 \\  (oo)\\_______                    ",
					"                    (__)\\       )\\/\\                ",
					"                        ||----w |                    ",
					"                        ||     ||                    ",
				}, "\n"),
			},
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 1 },
				{ icon = "\u{f0c5} ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
				{ icon = "\u{f07b} ", title = "Projects", section = "projects", indent = 2, padding = 1 },
				{ section = "startup" },
			},
		},
	},
}
