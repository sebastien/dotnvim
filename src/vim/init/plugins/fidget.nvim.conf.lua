if pcall(require, "fidget") then
	require("fidget").setup({
		-- SEE https://github.com/j-hui/fidget.nvim
		notification = {
			window = {
				normal_hl = "FidgetNormal",
				winblend = 5,
				border = "rounded",
				border_hl = "FidgetBorder",
			},
		},
		progress = {
			display = {
				done_ttl = 3,
				progress_ttl = math.huge,
			},
		},
	})
end
