vim.g.copilot_no_tab_map = true
vim.g.copilot_filetypes = {
	markdown = false,
}
vim.keymap.set("i", "<S-Tab>", 'copilot#Accept("\\<CR>")', {
	expr = true,
	silent = true,
	script = true,
})
