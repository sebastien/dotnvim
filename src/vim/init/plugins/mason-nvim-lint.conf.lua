local has_plugin, _ = pcall(require,'mason-nvim-lint')
if has_plugin then
	require("mason-nvim-lint").setup({
		quiet_mode = true,
		automatic_installation = false,  -- Disable auto-install to prevent race conditions
	})
end
