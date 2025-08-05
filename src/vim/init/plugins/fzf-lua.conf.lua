-- SEE https://github.com/ibhagwan/fzf-lua
require("fzf-lua").setup({
	files = {
		-- Use git ls-files when in a git repo to respect .gitignore
		cmd = "git ls-files --exclude-standard --cached --others 2>/dev/null || find . -type f -not -path '*/.*' | head -1000",
		git_icons = true,
		file_icons = true,
		color_icons = true,
	},
	grep = {
		rg_opts = "--column --line-number --no-heading --color=always --smart-case --hidden --glob='!.git/'",
		grep_opts = "-r -n -H --color",
		grep_cmd = "grep",
		grep_last_search = true,
	},
	fzf_colors = true,
})
