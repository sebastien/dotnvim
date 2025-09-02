-- SEE: https://github.com/NickvanDyke/opencode.nvim
-- Integration with opencode AI assistant

local opencode = require("opencode")

-- Make opencode available globally for VimL keymaps
_G.opencode = opencode

-- Setup opencode with basic configuration
vim.g.opencode_opts = {
	-- Model configuration
	model = "github-copilot/gpt-4.1",

	-- Context providers
	contexts = {
		-- Add custom contexts if needed
	},

	-- UI configuration
	-- ui = {
	-- 	-- Use snacks input for better prompt input
	-- 	input = "snacks",
	-- },

	-- Terminal configuration
	terminal = {
		-- Auto-connect to existing opencode terminals
		auto_connect = true,
		-- Terminal command to run opencode
		command = "opencode",
	},

	-- File watching for auto-reload
	watch = {
		enabled = true,
		patterns = { "*.lua", "*.py", "*.js", "*.ts", "*.rs", "*.go" },
	},
}

-- -- Key mappings for opencode functions
-- local map = vim.keymap.set
-- local opts = { noremap = true, silent = true }
--
-- -- Basic opencode commands
-- map("n", "<leader>oa", function() opencode.ask() end, { desc = "Ask opencode" })
-- map("n", "<leader>ot", function() opencode.toggle() end, { desc = "Toggle embedded opencode" })
-- map("n", "<leader>op", function() opencode.select_prompt() end, { desc = "Select prompt" })
-- map("n", "<leader>on", function() opencode.command("session_new") end, { desc = "New session" })
--
-- -- Context-aware commands
-- map("n", "<leader>oA", function() opencode.ask("@cursor: ") end, { desc = "Ask about cursor context" })
-- map("v", "<leader>oa", function() opencode.ask("@selection: ") end, { desc = "Ask about selection" })
-- map("n", "<leader>oe", function() opencode.prompt("Explain @cursor and its context") end, { desc = "Explain code near cursor" })
--
-- -- Message navigation
-- map("n", "<S-C-u>", function() opencode.command("messages_half_page_up") end, { desc = "Scroll messages up" })
-- map("n", "<S-C-d>", function() opencode.command("messages_half_page_down") end, { desc = "Scroll messages down" })
--
-- -- Utility commands
-- map("n", "<leader>oy", function() opencode.command("messages_copy") end, { desc = "Copy last message" })
--
-- Listen for opencode events
-- vim.api.nvim_create_autocmd("User", {
-- 	pattern = "OpencodeEvent",
-- 	callback = function(args)
-- 		local event = args.data
-- 		if event.type == "session.idle" then
-- 			vim.notify("Opencode finished responding", vim.log.levels.INFO)
-- 		elseif event.type == "session.error" then
-- 			vim.notify("Opencode error: " .. (event.message or "Unknown error"), vim.log.levels.ERROR)
-- 		end
-- 	end,
-- })

-- EOF
