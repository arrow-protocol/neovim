return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		integrations = {
			mason = true,
		},
	},
	config = function()
		vim.cmd.colorscheme("catppuccin")
	end,
}
