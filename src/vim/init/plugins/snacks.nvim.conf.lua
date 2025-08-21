-- SEE: https://github.com/folke/snacks.nvim
-- Collection of QoL plugins for Neovim

if not vim.g.snacks_loaded then
	require("snacks").setup({
	lazy = { enabled = false },
	-- Enable key modules
	bigfile = { enabled = true },
	dashboard = { enabled = false },
	explorer = { enabled = true },
	indent = { enabled = true },
	notifier = { enabled = true },
	picker = { enabled = true },
	quickfile = { enabled = true },
	scope = { enabled = true },
	scroll = { enabled = true },
	statuscolumn = { enabled = true },
	words = { enabled = true },

	-- Configure input (used by opencode)
	input = {
		enabled = true,
		icon = " ",
		icon_hl = "SnacksInputIcon",
		icon_pos = "left",
		prompt_pos = "title",
		win = { style = "input" },
		expand = true,
	},

	-- Configure picker
	picker = {
		enabled = true,
		ui_select = true,
		sources = {},
		layout = {
			preset = "default",
		},
		win = {
			input = {
				keys = {
					["<Esc>"] = { "close", mode = { "n", "i" } },
					["<C-c>"] = { "close", mode = { "n", "i" } },
					["<C-q>"] = { "close", mode = { "n", "i" } },
					["<CR>"] = { "confirm" },
					["<Up>"] = { "list_up" },
					["<Down>"] = { "list_down" },
					["<C-p>"] = { "list_up" },
					["<C-n>"] = { "list_down" },
					["<C-u>"] = { "preview_scroll_up" },
					["<C-d>"] = { "preview_scroll_down" },
				},
			},
		},
	},
	-- Configure notifier
	notifier = {
		enabled = true,
		timeout = 3000,
		margin = { top = 1, right = 1, bottom = 1 },
		padding = true,
		sort = { "level", "added" },
		level = vim.log.levels.INFO,
		icons = {
			error = " ",
			warn = " ",
			info = " ",
			debug = " ",
			trace = " ",
		},
		style = "compact",
	},
	})
	vim.g.snacks_loaded = true
end
