vim.g.copilot_no_tab_map = true
vim.g.copilot_filetypes = {
	markdown = false,
}
-- SEE: https://github.com/orgs/community/discussions/29817
vim.keymap.set("i", "<S-Tab>", 'copilot#Accept("\\<CR>")', {
	noremap = true,
	expr = true,
	silent = true,
	script = true,
	replace_keycodes = false,
})
