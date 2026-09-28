-- turn on spell check for markdown, text files and git commit messages
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("spell-check", { clear = true }),
	pattern = { "markdown", "text", "gitcommit" },
	callback = function()
		vim.opt_local.spell = true
		vim.opt_local.spelllang = { "en", "ru" }
	end,
})

-- highlight yanked text briefly
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight-yank", {
		clear = true,
	}),
	callback = function()
		vim.hl.on_yank()
	end,
})
