-- Set omnifunc for LSP completion
vim.api.nvim_set_option_value('omnifunc', 'v:lua.vim.lsp.omnifunc', {})

-- Set a reasonable updatetime (default is 4000ms, which is too long)
vim.opt.updatetime = 300

-- Autocommand to show hover on CursorHold
vim.api.nvim_create_autocmd("CursorHold", {
	buffer = 0, -- Apply to all buffers
	callback = function()
		-- Check if LSP is active in the current buffer
		if vim.lsp.get_clients({ bufnr = 0 }) then
			vim.lsp.buf.hover()
		end
	end,
})

-- Optional: Autocommand to close the hover window when the cursor moves
vim.api.nvim_create_autocmd("CursorMoved", {
	buffer = 0,
	callback = function()
		-- Check if there's an active hover window and close it
		for _, winid in ipairs(vim.api.nvim_list_wins()) do
			if vim.api.nvim_win_get_config(winid).zindex == 50 then -- Default zindex for hover
				vim.api.nvim_win_close(winid, true)
				break
			end
		end
	end,
})

-- Enables inlay hints for LSP
vim.lsp.inlay_hint.enable()

-- EOF
