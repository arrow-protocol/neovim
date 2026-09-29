return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			theme = "auto",
			globalstatus = true,
		},
		sections = {
			lualine_x = {
				{
					function()
						local blame = vim.trim(vim.b.gitsigns_blame_line or "")
						local max = math.floor(vim.o.columns / 3)
						if vim.fn.strchars(blame) > max then
							blame = vim.fn.strcharpart(blame, 0, max - 1) .. "…"
						end
						return blame
					end,
					color = "Comment",
				},
				"filetype",
			},
		},
	},
}
