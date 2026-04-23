return {
	"echasnovski/mini.nvim",
	event = "VeryLazy",
	dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
	config = function()
		require("mini.ai").setup()
		require("mini.move").setup()
		require("mini.pairs").setup()
		require("mini.surround").setup({
			mappings = {
				add = "gsa",
				delete = "gsd",
				find = "gsf",
				find_left = "gsF",
				highlight = "gsh",
				replace = "gsr",
				update_n_lines = "gsn",
			},
		})
		require("mini.cursorword").setup()
		require("mini.cmdline").setup()
		require("mini.comment").setup({
			options = {
				custom_commentstring = function()
					return require("ts_context_commentstring.internal").calculate_commentstring()
						or vim.bo.commentstring
				end,
			},
		})
	end,
}
