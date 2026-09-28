return {
	"folke/snacks.nvim",
	lazy = false,
	opts = {
		explorer = {
			enabled = true,
			replace_netrw = true, -- open the explorer instead of netrw for directories
			trash = true, -- delete to the system trash
		},
		picker = {
			enabled = true, -- also use the picker for vim.ui.select (code actions, etc.)
			sources = {
				explorer = {
					hidden = true, -- show dotfiles
				},
			},
		},
		lazygit = {
			enabled = true,
		},
		notifier = {
			enabled = true,
		},
		words = {
			enabled = true,
		},
		indent = {
			enabled = true,
		},
		dashboard = {
			row = 1,
			preset = {
				keys = {
					{ icon = "\u{f0349} ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
					{ icon = "\u{f15c} ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
					{ icon = "\u{f0c5} ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
					{
						icon = "\u{f013} ",
						key = "c",
						desc = "Config",
						action = ":lua Snacks.dashboard.pick('files', { cwd = vim.fn.stdpath('config') })",
					},
					{ icon = "\u{f04b2} ", key = "L", desc = "Lazy", action = ":Lazy" },
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
	keys = {
		{
			"<leader>e",
			function()
				Snacks.explorer()
			end,
			desc = "File explorer",
		},
		{
			"]]",
			function()
				Snacks.words.jump(vim.v.count1)
			end,
			desc = "Next reference",
		},
		{
			"[[",
			function()
				Snacks.words.jump(-vim.v.count1)
			end,
			desc = "Prev reference",
		},
		{
			"<leader>n",
			function()
				Snacks.notifier.show_history()
			end,
			desc = "Notification history",
		},
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Find files",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.grep()
			end,
			desc = "Live grep",
		},
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Find buffers",
		},
		{
			"<leader>fh",
			function()
				Snacks.picker.help()
			end,
			desc = "Help tags",
		},
		{
			"<leader>fs",
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = "Document symbols",
		},
		{
			"<leader>gg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<leader>gl",
			function()
				Snacks.lazygit.log()
			end,
			desc = "Git log",
		},
		{
			"<leader>gf",
			function()
				Snacks.lazygit.log_file()
			end,
			desc = "Git log (current file)",
		},
		{
			"<leader>gB",
			function()
				Snacks.gitbrowse()
			end,
			mode = { "n", "x" },
			desc = "Open in browser",
		},
		{
			"gd",
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = "Go to definition",
		},
		{
			"grr",
			function()
				Snacks.picker.lsp_references()
			end,
			nowait = true,
			desc = "References",
		},
		{
			"gri",
			function()
				Snacks.picker.lsp_implementations()
			end,
			desc = "Implementations",
		},
		{
			"gy",
			function()
				Snacks.picker.lsp_type_definitions()
			end,
			desc = "Type definition",
		},
	},
}
