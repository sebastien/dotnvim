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
	},
})
-- EOF
