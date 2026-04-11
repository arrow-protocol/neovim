local g = vim.g
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
opt.incsearch = true -- show matches as you type
opt.hlsearch = false -- don't keep highlights after search

-- UI
opt.termguicolors = true
opt.cursorline = true
opt.signcolumn = "yes" -- always show sign column (prevents layout shift)
opt.scrolloff = 10
opt.splitright = true -- vertical splits open to the right
opt.splitbelow = true -- horizontal splits open below

opt.mousemoveevent = true

-- Files
opt.swapfile = false
opt.undofile = true
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.hidden = true -- allow switching buffers without saving

-- Performance
opt.updatetime = 250 -- faster CursorHold events (used by LSP)
opt.timeoutlen = 300 -- time to wait for a key sequence

-- Clipboard: use system clipboard
-- requires win32yank.exe on Windows (installed automatically with some setups)
opt.clipboard = "unnamedplus"

-- Statusline & command bar
opt.laststatus = 3

-- Diagnostics
diagnostic.config({
	signs = {
		text = {
			[diagnostic.severity.ERROR] = "\u{f057}",
			[diagnostic.severity.WARN] = "\u{f071}",
			[diagnostic.severity.INFO] = "\u{f05a}",
			[diagnostic.severity.HINT] = "\u{f0eb}",
		},
	},
})
