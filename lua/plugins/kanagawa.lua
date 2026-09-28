return {
	"rebelot/kanagawa.nvim",
	lazy = true,
	config = function()
		require("kanagawa").setup({
			colors = {
				theme = {
					all = {
						ui = {
							float = {
								bg_border = "none",
								bg = "none",
							},
						},
					},
				},
			},
		})
	end,
}
