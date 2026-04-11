return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = { "javascript", "typescript", "jsx", "tsx", "json", "html", "css", "lua" },
		auto_install = true,
		highlight = {
			enable = true,
		},
	},
}
