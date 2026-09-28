return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{
			"mason-org/mason.nvim",
			opts = {},
		},
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local function map(lhs, rhs, desc)
					vim.keymap.set("n", lhs, rhs, { buffer = ev.buf, desc = desc })
				end
				map("gd", vim.lsp.buf.definition, "Go to definition")
				map("K", vim.lsp.buf.hover, "Hover")
				map("<leader>d", vim.diagnostic.open_float, "Line diagnostics")
			end,
		})

		vim.lsp.config("*", {
			capabilities = require("blink.cmp").get_lsp_capabilities(),
		})

		require("mason-lspconfig").setup({
			ensure_installed = { "ts_ls", "lua_ls", "eslint" },
		})

		require("mason-tool-installer").setup({
			ensure_installed = { "stylua", "prettierd", "eslint_d" },
		})
	end,
}
