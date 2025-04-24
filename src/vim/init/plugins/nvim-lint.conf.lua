-- SEE: https://github.com/mfussenegger/nvim-lint
local success, err = pcall(function()
	require("conform")
end)
if success then
	require("lint").linters_by_ft = {
		markdown = { "vale" },
		python = { "mypy", "bandit" },
		javascript = { "eslint", "deno" },
		sh = { "shellcheck" },
		html = { "tidy" },
		bash = { "shellcheck" },
		lua = { "luacheck" },
	}
	vim.api.nvim_create_autocmd({ "BufWritePost" }, {
		callback = function()
			require("lint").try_lint()
		end,
	})
end
-- EOF
