return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
		keys = {
			{ "<leader>e", "<cmd>Neotree reveal toggle float<cr>", desc = "File explorer" },
		},
		opts = {
			default_component_configs = {
				git_status = {
					symbols = {
						added = "A",
						modified = "M",
						deleted = "D",
						renamed = "R",
						untracked = "U",
						ignored = "I",
						unstaged = "~",
						staged = "+",
						conflict = "!",
					},
				},
			},
		},
	},
}
