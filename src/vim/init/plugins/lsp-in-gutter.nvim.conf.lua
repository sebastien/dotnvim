-- SEE: https://github.com/TomDeneire/lsp-in-gutter.nvim
function config()
	local icons = {}
	icons[vim.diagnostic.severity.ERROR] = " "
	icons[vim.diagnostic.severity.WARN] = " "
	icons[vim.diagnostic.severity.HINT] = " "
	icons[vim.diagnostic.severity.INFO] = " "

	local opts = {}
	opts["icons"] = icons
	opts["show_icons"] = true
	opts["show_lnum"] = true
	opts["show_colors"] = true
	-- formatter function that takes the vim.diagnostic object as argument
	-- e.g. `function format(diagnostic) return diagnostic.message end`
	opts["format"] = nil
	return opts

end
if pcall(require, "lsp-in-gutter") then
	vim.diagnostic.config(
	{
		underline = false,
		virtual_text = false,
		update_in_insert = false,
		severity_sort = true,
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = " ",
				[vim.diagnostic.severity.WARN] = " ",
				[vim.diagnostic.severity.HINT] = " ",
				[vim.diagnostic.severity.INFO] = " ",
			},
		},
	})
	require("lsp-in-gutter").setup(config())
end
-- EOF
