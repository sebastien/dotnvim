if pcall(require, "metals") then
	local config = require("metals").bare_config()
	config.runLsp = true
	-- Ensure you have coursier installed and on your PATH
	-- or specify the path to the coursier jar
	-- serverVersion = "LATEST_SNAPSHOT", -- Or a specific version
	config.serverProperties = {
		"-Xms1G",
		"-Xmx2G",
		"-XX:+UseG1GC",
		"-XX:MaxMetaspaceSize=1G",
	}
	-- For Scala 3, Metals might need specific Java versions (e.g., 11 or 17)
	-- You can often configure this via .jvmopts in your project or globally.
	config.on_attach = function(client, bufnr)
		-- your on_attach function
		-- if client.name == "metals" then
		-- 	-- Disable Metals formatting if using conform.nvim for Scala
		-- 	client.server_capabilities.documentFormattingProvider = false
		-- 	client.server_capabilities.documentRangeFormattingProvider = false
		-- end
	end

	local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
	vim.api.nvim_create_autocmd("FileType", {
		pattern = { "scala", "sbt", "java", "mill" },
		callback = function()
			require("metals").initialize_or_attach(config)
		end,
		group = nvim_metals_group,
	})
end
