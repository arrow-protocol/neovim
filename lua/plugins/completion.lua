return {
	"saghen/blink.cmp",
	version = "1.*", -- use a release tag to download the prebuilt fuzzy matcher
	event = { "InsertEnter", "CmdlineEnter" },
	opts = {
		keymap = {
			preset = "enter",
			["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
			["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
		},
		appearance = {
			nerd_font_variant = "mono",
		},
		completion = {
			menu = {
				draw = {
					treesitter = { "lsp" }, -- highlight LSP labels with treesitter
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
			},
			ghost_text = {
				enabled = true,
			},
		},
		signature = {
			enabled = true,
		},
		sources = {
			default = { "lazydev", "lsp", "path", "snippets", "buffer" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100, -- show lazydev completions first
				},
			},
		},
	},
}
