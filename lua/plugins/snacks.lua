local glyphs = {
	["0"] = { "█████", "█   █", "█   █", "█   █", "█████" },
	["1"] = { "    █", "    █", "    █", "    █", "    █" },
	["2"] = { "█████", "    █", "█████", "█    ", "█████" },
	["3"] = { "█████", "    █", "█████", "    █", "█████" },
	["4"] = { "█   █", "█   █", "█████", "    █", "    █" },
	["5"] = { "█████", "█    ", "█████", "    █", "█████" },
	["6"] = { "█████", "█    ", "█████", "█   █", "█████" },
	["7"] = { "█████", "    █", "    █", "    █", "    █" },
	["8"] = { "█████", "█   █", "█████", "█   █", "█████" },
	["9"] = { "█████", "█   █", "█████", "    █", "█████" },
	[":"] = { " ", "█", " ", "█", " " },
}

local function big_clock()
	local rows = {}
	for i = 1, 5 do
		local row = {}
		for ch in os.date("%H:%M:%S"):gmatch(".") do
			table.insert(row, glyphs[ch][i])
		end
		rows[i] = table.concat(row, "  ")
	end
	return table.concat(rows, "\n")
end

return {
	"folke/snacks.nvim",
	lazy = false,
	init = function()
		local timer
		vim.api.nvim_create_autocmd("User", {
			pattern = "SnacksDashboardOpened",
			callback = function()
				timer = timer or vim.uv.new_timer()
				timer:start(1000, 1000, vim.schedule_wrap(Snacks.dashboard.update))
			end,
		})
		vim.api.nvim_create_autocmd("User", {
			pattern = "SnacksDashboardClosed",
			callback = function()
				if timer then
					timer:stop()
				end
			end,
		})
	end,
	opts = {
		explorer = {
			enabled = true,
			replace_netrw = true, -- open the explorer instead of netrw for directories
			trash = true, -- delete to the system trash
		},
		picker = {
			enabled = true, -- also use the picker for vim.ui.select (code actions, etc.)
			sources = {
				explorer = {
					hidden = true, -- show dotfiles
				},
			},
		},
		lazygit = {
			enabled = true,
		},
		notifier = {
			enabled = true,
		},
		words = {
			enabled = true,
		},
		indent = {
			enabled = true,
		},
		dashboard = {
			sections = {
				function()
					return { text = { { big_clock(), hl = "SnacksDashboardHeader" } }, align = "center", padding = 2 }
				end,
				{ section = "startup" },
			},
		},
	},
	keys = {
		{
			"<leader>e",
			function()
				Snacks.explorer()
			end,
			desc = "File explorer",
		},
		{
			"]]",
			function()
				Snacks.words.jump(vim.v.count1)
			end,
			desc = "Next reference",
		},
		{
			"[[",
			function()
				Snacks.words.jump(-vim.v.count1)
			end,
			desc = "Prev reference",
		},
		{
			"<leader>n",
			function()
				Snacks.notifier.show_history()
			end,
			desc = "Notification history",
		},
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Find files",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.grep()
			end,
			desc = "Live grep",
		},
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Find buffers",
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.recent()
			end,
			desc = "Recent files",
		},
		{
			"<leader>fh",
			function()
				Snacks.picker.help()
			end,
			desc = "Help tags",
		},
		{
			"<leader>fs",
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = "Document symbols",
		},
		{
			"<leader>gg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<leader>gl",
			function()
				Snacks.lazygit.log()
			end,
			desc = "Git log",
		},
		{
			"<leader>gf",
			function()
				Snacks.lazygit.log_file()
			end,
			desc = "Git log (current file)",
		},
		{
			"<leader>gB",
			function()
				Snacks.gitbrowse()
			end,
			mode = { "n", "x" },
			desc = "Open in browser",
		},
		{
			"gd",
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = "Go to definition",
		},
		{
			"grr",
			function()
				Snacks.picker.lsp_references()
			end,
			nowait = true,
			desc = "References",
		},
		{
			"gri",
			function()
				Snacks.picker.lsp_implementations()
			end,
			desc = "Implementations",
		},
		{
			"gy",
			function()
				Snacks.picker.lsp_type_definitions()
			end,
			desc = "Type definition",
		},
	},
}
