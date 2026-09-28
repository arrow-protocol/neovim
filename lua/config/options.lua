local g = vim.g
local o = vim.o
local opt = vim.opt
local diagnostic = vim.diagnostic

-- Leader keys (must be set before lazy)
g.mapleader = " "
g.maplocalleader = "\\"

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Indentation (2 spaces for JS/TS)
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.smartindent = true

-- Search
opt.ignorecase = true -- case-insensitive search...
opt.smartcase = true -- ...unless you type a capital letter
opt.hlsearch = false -- don't keep highlights after search

-- UI
opt.cursorline = true
opt.signcolumn = "yes" -- always show sign column (prevents layout shift)
opt.scrolloff = 10
opt.splitright = true -- vertical splits open to the right
opt.splitbelow = true -- horizontal splits open below
o.winborder = "rounded"

-- Files
opt.swapfile = false
opt.undofile = true

-- Performance
opt.updatetime = 250 -- faster CursorHold events (used by LSP)
opt.timeoutlen = 300 -- time to wait for a key sequence

-- Statusline & command bar
opt.cmdheight = 0

-- Diagnostics
diagnostic.config({
	virtual_text = {
		spacing = 2,
		current_line = true,
	},
	severity_sort = true,
	signs = {
		text = {
			[diagnostic.severity.ERROR] = "\u{f057}",
			[diagnostic.severity.WARN] = "\u{f071}",
			[diagnostic.severity.INFO] = "\u{f05a}",
			[diagnostic.severity.HINT] = "\u{f0eb}",
		},
	},
})

-- Clipboard: use system clipboard
vim.schedule(function()
	opt.clipboard = "unnamedplus"
end)
