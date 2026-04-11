return {
	"lewis6991/gitsigns.nvim",
	opts = {
		on_attach = function(bufnr)
			local gitsigns = require("gitsigns")

			local function map(mode, l, r, desc)
				vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
			end

			-- Navigation
			map("n", "]c", function()
				gitsigns.nav_hunk("next")
			end, "Next hunk")
			map("n", "[c", function()
				gitsigns.nav_hunk("prev")
			end, "Prev hunk")

			-- Actions
			map("n", "<leader>hs", gitsigns.stage_hunk, "Stage hunk")
			map("n", "<leader>hr", gitsigns.reset_hunk, "Reset hunk")
			map("n", "<leader>hp", gitsigns.preview_hunk, "Preview hunk")
			map("n", "<leader>hi", gitsigns.preview_hunk_inline, "Preview hunk inline")

			map("n", "<leader>hS", gitsigns.stage_buffer, "Stage buffer")
			map("n", "<leader>hR", gitsigns.reset_buffer, "Reset buffer")

			map("n", "<leader>hd", function()
				gitsigns.diffthis("~")
			end, "Diff against last commit")

			map("n", "<leader>hb", function()
				gitsigns.blame_line({ full = true })
			end, "Blame line")

			-- Toggles
			map("n", "<leader>tb", gitsigns.toggle_current_line_blame, "Toggle line blame")
		end,
	},
}
