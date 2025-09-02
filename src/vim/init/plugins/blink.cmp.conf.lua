-- SEE: https://cmp.saghen.dev/installation.html
-- NOTES: Need to be compiled by hand,
-- rustup toolchain install nightly
-- and then env -C ~/.config/nvim/pack/minpac/opt/blink.cmp/ cargo build --release
-- if that doesn't work, the files can be downloaded and installed in
-- target/release/libblink_cmp_fuzzy.{so,dylib}

require("blink.cmp").setup({
	-- SEE <https://cmp.saghen.dev/configuration/keymap.html>
	keymap = {
		["<Tab>"] = {
			function(cmp)
				if cmp.snippet_active() then
					return cmp.accept()
				else
					return cmp.select_and_accept()
				end
			end,
			"snippet_forward",
			"fallback",
		},
		["<C-k>"] = { "show_documentation", "fallback" },
		["<C-K>"] = { "show_documentation", "fallback" },
	},
	-- Enable automatic completion as you type
	completion = {
		accept = { auto_brackets = { enabled = true } },
		menu = {
			auto_show = true,
			draw = {
				treesitter = { "lsp" },
			},
		},
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 500,
			update_delay_ms = 50,
			treesitter_highlighting = true,
			window = {
				min_width = 10,
				max_width = 60,
				max_height = 20,
				border = "rounded",
				winblend = 5,
				winhighlight = "Normal:BlinkCmpDocGreen,FloatBorder:BlinkCmpDocBorderGreen,CursorLine:BlinkCmpDocCursorLineGreen,Search:None",
				scrollbar = true,
			},
		},
		-- trigger = {
		-- 	signature_help = { enabled = true },
		-- },
	},
	-- Configure signature help
	signature = {
		enabled = true,
		trigger = {
			blocked_trigger_characters = {},
			blocked_retrigger_characters = {},
			show_on_insert_on_trigger_character = true,
		},
		window = {
			min_width = 1,
			max_width = 100,
			max_height = 10,
			border = "rounded",
			winblend = 5,
			winhighlight = "Normal:BlinkCmpSignatureHelpGreen,FloatBorder:BlinkCmpSignatureHelpBorderGreen",
			scrollbar = false,
		},
	},
	-- Configure sources for LSP completions
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
		providers = {
			lsp = {
				min_keyword_length = 0,
				score_offset = 0,
			},
		},
	},
	-- SEE: https://github.com/saghen/blink.cmp/releases/tag/v1.1.1
	fuzzy = {
		implementation = "rust",
		prebuilt_binaries = { download = false, ignore_version_mismatch = true },
	},
})
