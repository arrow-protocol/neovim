return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	branch = "main",
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
			callback = function(args)
				pcall(vim.treesitter.start, args.buf)
			end,
		})
	end,
}
