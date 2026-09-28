return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{
			"mason-org/mason.nvim",
			opts = {
				ui = {
					backdrop = 100,
				},
			},
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
				map("<leader>d", vim.diagnostic.open_float, "Line diagnostics")
			end,
		})

		vim.lsp.config("*", {
			capabilities = require("blink.cmp").get_lsp_capabilities(),
		})

		local base_on_attach = vim.lsp.config.eslint.on_attach

		vim.lsp.config("eslint", {
			on_attach = function(client, bufnr)
				if base_on_attach then
					base_on_attach(client, bufnr)
				end

				vim.api.nvim_create_autocmd("BufWritePre", {
					group = vim.api.nvim_create_augroup("eslint-fix-" .. bufnr, { clear = true }),
					buffer = bufnr,
					command = "LspEslintFixAll",
				})
			end,
		})

		require("mason-lspconfig").setup({
			ensure_installed = { "ts_ls", "lua_ls", "eslint" },
		})

		require("mason-tool-installer").setup({
			ensure_installed = { "stylua", "prettierd" },
		})
	end,
}
