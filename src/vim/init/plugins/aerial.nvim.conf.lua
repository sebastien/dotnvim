if pcall(require, "aerial") then
	require("aerial").setup({
		placement = "edge",
		show_lsp_diagnostics = true,
		-- You can also customize the signs for diagnostics
		-- For example:
		signs = {
			"DiagnosticSignError",
			"DiagnosticSignWarn",
			"DiagnosticSignInfo",
			"DiagnosticSignHint",
		},
		-- optionally use on_attach to set keymaps when aerial has attached to a buffer
		on_attach = function(bufnr)
			-- Jump forwards/backwards with '{' and '}'
			vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
			vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
		end,
	})
	-- You probably also want to set a keymap to toggle aerial
	vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
end

-- Example of defining custom diagnostic signs (if you haven't already)
-- This ensures the signs are visible in the sign column
-- vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticError', numhl = '' })
-- vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticWarn', numhl = '' })
-- vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticInfo', numhl = '' })
-- vim.fn.sign_define('DiagnosticSignHint', { text = '�', texthl = 'DiagnosticHint', numhl = '' })

-- EOF
