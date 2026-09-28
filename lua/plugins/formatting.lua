return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettierd" },
			javascriptreact = { "prettierd" },
			typescript = { "prettierd" },
			typescriptreact = { "prettierd" },
			css = { "prettierd" },
			json = { "prettierd" },
			jsonc = { "prettierd" },
		},
		format_on_save = { timeout_ms = 3000, lsp_format = "fallback" },
	},
}
