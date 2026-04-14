return {
	"stevearc/aerial.nvim",
	opts = {
		layout = {
			max_width = { 80, 0.2 },
			min_width = 40,
			default_direction = "left",
		},
		nerd_font = true,

		on_attach = function(bufnr)
			vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
			vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
		end,

		show_guides = true,
	},
	keys = {
		{ "<leader>a", "<cmd>AerialToggle!<CR>", desc = "Toggle Aerial" },
		{ "<leader>o", "<cmd>AerialNavToggle<CR>", desc = "Aerial Nav" },
	},
}
