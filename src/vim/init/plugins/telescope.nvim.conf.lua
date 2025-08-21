local ignore_filetypes_list = {
	"venv",
	"__pycache__",
	"node_modules",
	"%.xlsx",
	"%.jpg",
	"%.png",
	"%.webp",
	"%.pdf",
	"%.odt",
	"%.ico",
}

local telescope = require("telescope")
telescope.setup({
	defaults = {
		file_ignore_patterns = ignore_filetypes_list,
		path_display = {
			shorten = {
				len = 1,
				exclude = {1, 2, -3, -2, -1}
			}
		},
	},
})
-- EOF
