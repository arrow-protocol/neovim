return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter")
			.install({
				-- core
				"lua",
				-- web
				"html",
				"css",
				"javascript",
				"typescript",
				"tsx",
				-- data/config
				"json",
				-- docs
				"markdown",
				"markdown_inline",
			})
			:wait(300000)

		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"lua",
				"html",
				"css",
				"javascript",
				"typescript",
				"tsx",
				"json",
				"markdown",
			},
			callback = function()
				vim.treesitter.start()
			end,
		})
	end,
}
