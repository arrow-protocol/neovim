return {
	"tpope/vim-fugitive",
	cmd = { "Git", "G", "Gread", "Gwrite", "GBrowse", "Gdiffsplit", "Gvdiffsplit" },
	keys = {
		{ "<leader>gs", "<cmd>Git<cr>", desc = "Git status" },
		{ "<leader>gc", "<cmd>Git commit<cr>", desc = "Git commit" },
		{ "<leader>gp", "<cmd>Git pull<cr>", desc = "Git pull" },
		{ "<leader>gP", "<cmd>Git push<cr>", desc = "Git push" },
		{ "<leader>gl", "<cmd>Git log --oneline<cr>", desc = "Git log" },
		{ "<leader>gd", "<cmd>Gdiffsplit<cr>", desc = "Git diff split" },
		{ "<leader>gb", "<cmd>Git blame<cr>", desc = "Git blame" },
	},
}
