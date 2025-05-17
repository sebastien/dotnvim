-- SEE https://github.com/ibhagwan/fzf-lua
require("fzf-lua").setup({
	grep = {
		rg_opts = "--column --line-number --no-heading --color=always --smart-case",
		grep_opts = "-r -n -H --color",
		grep_cmd = "grep",
		grep_last_search = true,
	},
	actions = {
		["default"] = {
			["grep_project"] = {
				action = "toggle",
				opts = {
					grep_cmd = "grep",
					grep_opts = "-r -n -H --color",
				},
			},
		},
	},
	-- MISC GLOBAL SETUP OPTIONS, SEE BELOW
	-- fzf_bin = ...,
	-- each of these options can also be passed as function that return options table
	-- e.g. winopts = function() return { ... } end
	winopts = { ... }, -- UI Options
	keymap = { ... }, -- Neovim keymaps / fzf binds
	fzf_opts = { ... }, -- Fzf CLI flags
	fzf_colors = true, -- Generate colors from colorscheme
	hls = { ... }, -- Highlights
	previewers = { ... }, -- Previewers options
	-- SPECIFIC COMMAND/PICKER OPTIONS, SEE BELOW
	-- files = { ... },
})
